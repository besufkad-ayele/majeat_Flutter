import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/core/shared/widgets/blured_container.dart';
import 'package:majeat/core/shared/widgets/divder.dart';
import 'package:majeat/feature/GroupOrder/model/group_model.dart';
import 'package:majeat/feature/GroupOrder/model/sample_group_order_list.dart';
import 'package:majeat/feature/GroupOrder/presentation/pages/group_order_detailpage.dart';
import 'package:majeat/feature/GroupOrder/presentation/widgets/GroupOrderBottomSheet.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:majeat/feature/login/model/user_login.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class GroupOrderPage extends StatefulWidget {
  const GroupOrderPage({super.key});

  @override
  _GroupOrderPageState createState() => _GroupOrderPageState();
}

class _GroupOrderPageState extends State<GroupOrderPage> {
  List<GroupOrder> groupOrders = [];
  List<GroupOrder> filteredOrders = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    // Initialize with some dummy data
    groupOrders = sampleGroupOrder;
    filteredOrders = groupOrders;
  }

  void _filterGroups(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredOrders = groupOrders;
      } else {
        filteredOrders = groupOrders.where((order) {
          return order.name.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      if (!isSearching) {
        filteredOrders = groupOrders;
      }
    });
  }

  void _showCreateGroupOrderBottomSheet(BuildContext context) async {
    final newGroupOrder = await showModalBottomSheet<GroupOrder>(
      context: context,
      isScrollControlled:
          true, // Allows the bottom sheet to be scrollable and take up more space
      useSafeArea: true, // Ensures the bottom sheet avoids system UI areas
      backgroundColor:
          const Color.fromARGB(250, 238, 190, 69), // Custom background color
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: DraggableScrollableSheet(
            initialChildSize: 1.0,
            minChildSize: 0.3,
            maxChildSize: 1.0,
            builder: (context, scrollController) {
              return const CreateGroupOrderBottomSheet();
            },
          ),
        );
      },
    );

    if (newGroupOrder != null) {
      setState(() {
        groupOrders.add(newGroupOrder);
        filteredOrders = groupOrders;
      });
    }
  }

  void _createGroupOrder(List<Food> selectedFoods, Restaurant restaurant ,BuildContext context) {
    AppState appStateRead = context.read<AppState>();
    final newOrder = GroupOrder(
      resturant: restaurant,
      members: [
        User(
            id: appStateRead.logincontroller.signedinUser![0].id,
            name: appStateRead.logincontroller.signedinUser![0].name,
            email: appStateRead.logincontroller.signedinUser![0].email,
            image: appStateRead.logincontroller.signedinUser![0].image,
            password: appStateRead.logincontroller.signedinUser![0].password,
            location: appStateRead.logincontroller.signedinUser![0].location),
      ],
      GroupOrderid: const Uuid().v4(),
      name:
          'New Group Order', // You can modify this to get user input for the order name
      selectedFoods: [],
      createdAt: DateTime.now(),
    );
    setState(() {
      groupOrders.add(newOrder);
      filteredOrders = groupOrders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstant.primaryColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: isSearching
                ? TextField(
                    autofocus: true,
                    onChanged: _filterGroups,
                    decoration: const InputDecoration(
                      hintText: 'Search group orders...',
                      border: InputBorder.none,
                    ),
                  )
                : const Text('Group Orders'),
            actions: [
              IconButton(
                icon: Icon(isSearching ? Icons.close : Icons.search),
                onPressed: _toggleSearch,
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final groupOrder = filteredOrders[index];
                 String formattedCreatedDate = DateFormat('MMM d, h:mm a').format(groupOrder.createdAt);
                 String formattedEndDate = DateFormat('MMM d, h:mm a').format(groupOrder.orderEnd);
                return Column(
                  children: [
                    BlurredContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      backgroundColor:AppConstant.bakcGroundColor,
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(groupOrder.name),
                            BlurredContainer(
                              // backgroundColor: Colors.white,
                              child: Text(groupOrder.members.length.toString())),
                          ],
                        ),
                        subtitle: Text(
                            'Created on $formattedCreatedDate,            Ends on $formattedEndDate'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailGroupOrderPage(
                                selectedFoods: const [],
                                id: groupOrder.GroupOrderid,
                                name: groupOrder.name,
                                members: groupOrder.members,
                                createdAt: groupOrder.createdAt,
                                orderEnd: groupOrder.orderEnd,
                                paymentType: groupOrder.paymentType,
                                restaurant: groupOrder.resturant,                                 
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const CustomDivider(),
                  ],
                );
              },
              childCount: filteredOrders.length,
            ),
          ),
        ],
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              _showCreateGroupOrderBottomSheet(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const NewOrderPage(),
              //   ),
              // );
            },
            label: const Text('Create Group Order',style: TextStyle(color: AppConstant.blackTextColor),),
            icon: const Icon(Icons.add),
            backgroundColor: const Color.fromARGB(161, 142, 138, 138),
          ),
        ),
      ),
    );
  }
}

