import 'package:flutter/material.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/core/shared/widgets/custom_inkwell.dart';
import 'package:majeat/core/shared/widgets/divder.dart';
import 'package:majeat/feature/GroupOrder/model/group_model.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/AllResturantPages.dart';
import 'package:majeat/feature/favorite/Provider_controller/favoire_controller.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:majeat/feature/login/model/user_login.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:uuid/uuid.dart';

class CreateGroupOrderBottomSheet extends StatefulWidget {
  const CreateGroupOrderBottomSheet({super.key});

  @override
  _CreateGroupOrderBottomSheetState createState() =>
      _CreateGroupOrderBottomSheetState();
}

class _CreateGroupOrderBottomSheetState
    extends State<CreateGroupOrderBottomSheet> {
  List<Tuple2<Restaurant, Food>> orderResturant = [];
  Restaurant? selectedRestaurant;
  String paymentType = 'single';
  Duration? duration = const Duration(hours: 5);

  final TextEditingController _groupNameController = TextEditingController();

  void _selectRestaurant(Restaurant restaurant) {
    setState(() {
      selectedRestaurant = restaurant;
    });
  }

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = context.watch<FavoriteController>();
    orderResturant = favoriteController.getFavoriteItemsWithRestaurants();
    AppState appStateRead = context.read<AppState>();

    return orderResturant.isEmpty
        ? Padding(
            padding: const EdgeInsets.all(100.0),
            child: Center(
              child: Column(
                children: [
                  const Text(
                      'Your favorite food and restaurant is empty. Before group ordering, you should experience our restaurants.'),
                  CustomInkwell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Allresturantpages(),
                        ),
                      );
                    },
                    child: const Text('See all restaurants'),
                  ),
                ],
              ),
            ),
          )
        : Container(
            color: const Color.fromARGB(255, 196, 196, 196),
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                const Text(
                  'Select Food Items',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: orderResturant.length,
                    itemBuilder: (context, index) {
                      final restaurant = orderResturant[index].item1;
                      return GestureDetector(
                        onTap: () => _selectRestaurant(restaurant),
                        child: Container(
                          width: 100,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image:
                                            NetworkImage(restaurant.imageUrl),
                                      ),
                                    ),
                                  ),
                                  Text(restaurant.name),
                                ],
                              ),
                              if (selectedRestaurant == restaurant)
                                const Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Icon(Icons.check_circle,
                                      color: Colors.green),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                selectedRestaurant != null
                    ? ListTile(
                        title: Text(selectedRestaurant!.name),
                        leading: Image.network(selectedRestaurant!.imageUrl),
                        subtitle: Text(
                            'Menu length: ${selectedRestaurant!.menu.length}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: () {
                                setState(() {
                                  selectedRestaurant = null;
                                });
                              },
                            ),
                          ],
                        ),
                      )
                    : Container(),
                const CustomDivider(),
                const Text(
                  'Group Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: _groupNameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter group name',
                  ),
                ),
                const SizedBox(height: 16),
                const CustomDivider(),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Single Payment'),
                              value: 'single',
                              groupValue: paymentType,
                              onChanged: (value) {
                                setState(() {
                                  paymentType = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: const Text('Custom Split'),
                              value: 'custom',
                              groupValue: paymentType,
                              onChanged: (value) {
                                setState(() {
                                  paymentType = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const CustomDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RadioListTile<dynamic>(
                              title: const Text('1 hr'),
                              value: const Duration(hours: 1),
                              groupValue: duration,
                              onChanged: (value) {
                                setState(() {
                                  duration = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<dynamic>(
                              title: const Text('2 hr'),
                              value: const Duration(hours: 2),
                              groupValue: duration,
                              onChanged: (value) {
                                setState(() {
                                  duration = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<dynamic>(
                              title: const Text('3 hr'),
                              value: const Duration(hours: 3),
                              groupValue: duration,
                              onChanged: (value) {
                                setState(() {
                                  duration = value!;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<dynamic>(
                              title: const Text('4 hr'),
                              value: const Duration(hours: 4),
                              groupValue: duration,
                              onChanged: (value) {
                                setState(() {
                                  duration = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: selectedRestaurant == null
                      ? null
                      : () {
                          String groupName = _groupNameController.text.isEmpty
                              ? 'New Group Order'
                              : _groupNameController.text;

                          Navigator.pop(
                            context,
                            GroupOrder(
                              duration: duration,
                              members: [
                                User(
                                    id: appStateRead
                                        .logincontroller.signedinUser![0].id,
                                    name: appStateRead
                                        .logincontroller.signedinUser![0].name,
                                    email: appStateRead
                                        .logincontroller.signedinUser![0].email,
                                    image: appStateRead
                                        .logincontroller.signedinUser![0].image,
                                    password: appStateRead.logincontroller
                                        .signedinUser![0].password,
                                    location: appStateRead.logincontroller
                                        .signedinUser![0].location),
                              ],
                              resturant: selectedRestaurant!,
                              GroupOrderid: const Uuid().v4(),
                              name: groupName,
                              selectedFoods: [
                                // Tuple2<User, Food>  [
                                //   User(id: 2, name: 'name', email: 'email', image: 'image', password: 'password', location: 'location'),
                                //   Food(id: 2, name: 'name', imageUrl: 'd', description: 'description', price: 3, calories: 33, category: FoodCategory(name: 'food'))
                                // ]
                              ],
                              createdAt: DateTime.now(),
                              paymentType: paymentType,
                            ),
                          );
                        },
                  child: const Text('Create Group'),
                ),
              ],
            ),
          );
  }
}
