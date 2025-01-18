import 'package:flutter/material.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';
import 'package:majeat/core/shared/widgets/blured_container.dart';
import 'package:majeat/core/shared/widgets/custom_inkwell.dart';
import 'package:majeat/feature/GroupOrder/controller/group_order_controller.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/food_detail.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:majeat/feature/login/model/user_login.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class DetailGroupOrderPage extends StatefulWidget {
  const DetailGroupOrderPage({
    super.key,
    required this.id,
    required this.name,
    required this.members,
    required this.createdAt,
    required this.orderEnd,
    required this.paymentType,
    required this.restaurant, 
    required this.selectedFoods,
  });

  final String id;
  final String name;
  final List<User> members;
  final Restaurant restaurant;
  final DateTime createdAt;
  final DateTime orderEnd;
  final String paymentType;
  final List<Tuple2<Food, User>> selectedFoods;

  @override
  State<DetailGroupOrderPage> createState() => _DetailGroupOrderPageState();
}

class _DetailGroupOrderPageState extends State<DetailGroupOrderPage> {
  bool showAllMembers = false;

  // Method to add a food item to selectedFoods

  @override
  Widget build(BuildContext context) {
    // GroupOrderController groupOrderControllerRead =
    //     context.read<GroupOrderController>();
    GroupOrderController groupOrderControllerWatch =
        context.watch<GroupOrderController>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(181, 206, 177, 144),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 60.0, right: 20, top: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.name, style: AppConstant.headingStyle),
                      const SizedBox(width: 50),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      showAllMembers = !showAllMembers;
                    });
                  },
                  child: BlurredContainer(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 16),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Members',
                              style: AppConstant.headingStyle,
                            ),
                            const SizedBox(width: 20),
                            Text('${widget.members.length} members'),
                          ],
                        ),
                        if (showAllMembers)
                          SizedBox(
                            height:
                                200, // Specify a fixed height to avoid unbounded constraints
                            child: ListView.builder(
                              itemCount: widget.members.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(
                                                widget.members[index].image),
                                          ),
                                          Text(widget.members[index].name),
                                          const SizedBox(width: 10),
                                          Text(widget.members[index].location,overflow: TextOverflow.fade,),
                                        ],
                                      ),
                                      subtitle:
                                          Text(widget.members[index].email),
                                    ),
                                    const Divider(),
                                  ],
                                );
                              },
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      const Text(
                        "List of Selected Food Orders",
                        style: AppConstant.headingStyle,
                      ),
                      BlurredContainer(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 250, // Adjust the height as needed
                              child: ListView.builder(
                                itemCount: widget.selectedFoods.length,
                                itemBuilder: (context, index) {
                                  final food = widget.selectedFoods[index].item1;
                                  final user = widget.selectedFoods[index].item2;
                                  return ListTile(
                                    leading: Image.network(
                                      food.imageUrl,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    title: Text(food.name),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('${food.price} \$'),
                                        Text('Added by: ${user.name}'),
                                        Text('Email: ${user.email}'),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlurredContainer(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Invite people'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      BlurredContainer(
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(
                                            widget.restaurant.imageUrl),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        widget.restaurant.name,
                                        style: AppConstant.headingStyle,
                                      ),
                                    ],
                                  ),
                                  content: SizedBox(
                                    height:
                                        400, // Set a fixed height for the content
                                    width: double.maxFinite,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: widget.restaurant.menu.length,
                                            itemBuilder: (context, index) {
                                              final foodItem =
                                                  widget.restaurant.menu[index];
                                              return BlurredContainer(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: CustomInkwell(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            FoodDetail(
                                                                food: foodItem,
                                                                resturant: widget
                                                                    .restaurant),
                                                      ),
                                                    );
                                                  },
                                                  child: ListTile(
                                                    leading: Image.network(
                                                      foodItem.imageUrl,
                                                      width: 50,
                                                      height: 50,
                                                      fit: BoxFit.cover,
                                                    ),
                                                    title: Text(foodItem.name),
                                                    subtitle: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            '${foodItem.price} \$'),
                                                        Text(foodItem
                                                            .description),
                                                      ],
                                                    ),
                                                    trailing: IconButton(
                                                      icon: const Icon(Icons
                                                          .add_circle_outline),
                                                      onPressed: () {
                                                        // Handle add action
                                                        groupOrderControllerWatch.addToSelectedFoods(
                                                                foodItem,
                                                                widget.members[
                                                                    0],
                                                                    widget.selectedFoods); // Add the food item to selectedFoods
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("Option 1"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text("Option 2"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Menu'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
