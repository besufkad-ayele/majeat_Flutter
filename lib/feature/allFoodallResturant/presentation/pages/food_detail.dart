import 'package:flutter/material.dart';
import 'package:majeat/core/shared/widgets/custom_floating_action_button.dart';
import 'package:majeat/core/shared/widgets/divder.dart';
import 'package:majeat/feature/allFoodallResturant/controller/allFood_controller.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FoodDetail extends StatefulWidget {
  final Food food;
  final Restaurant resturant;
  int foodQuantity;

  FoodDetail({
    super.key,
    required this.food,
    required this.resturant,
    this.foodQuantity = 1,
  });

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  List<String> selectedPreferences = [];
  TextEditingController additionalPreferencesController =
      TextEditingController();

  // Sample list of preferences
  final List<String> preferences = [
    'Salt',
    'Onion',
    'Fat',
    'Carb',
    'Sugar',
    'Pepper',
    'Garlic',
    'Spice'
  ];

  @override
  Widget build(BuildContext context) {
    AllfoodResturantController allfoodController =
        context.read<AllfoodResturantController>();

    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        BtnTitile: "${widget.foodQuantity}",
        alignment: const Alignment(-0.98, -0.9),
        onPressed: () {
          Navigator.pop(context);
        },
        iCons: Icons.close,
        backgroundColor: Colors.grey.withOpacity(0.5),
      ),
      backgroundColor: const Color.fromARGB(208, 206, 177, 144),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 30),
                  Text(widget.food.name),
                  SizedBox(
                    width: 10,
                    child: InkWell(
                      onTap: () {
                        allfoodController.appState.toggleFavorite(widget.food);
                      },
                      child: widget.food.isFavorite
                          ? const Icon(
                              Icons.shopping_basket,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.shopping_basket,
                              color: Colors.grey,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Image description page
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 1),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(widget.food.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 30,
                            child: InkWell(
                              onTap: () {
                                allfoodController.appState
                                    .toggleFavorite(widget.food);
                              },
                              child: widget.food.isFavorite
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                      size: 30,
                                    )
                                  : const Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Intro detail: name, calories, and so on
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.food.name.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.food.price.toString(),
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.red),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Rating: ${widget.food.calories} ⚡',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 102, 64)),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16),
                              child: Text(
                                '😋 Enjoy ',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 214, 92),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(107, 222, 222, 222)
                                    .withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (widget.foodQuantity > 0) {
                                          widget.foodQuantity--;
                                        }
                                      });
                                    },
                                  ),
                                  Text('${widget.foodQuantity}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.foodQuantity++;
                                      });
                                    },
                                    icon: const Icon(Icons.add),
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const CustomDivider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Price: ${widget.food.price} 💲',
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 255, 102, 64)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 16),
                              child: Text(
                                'DISCOUNT: 💲 ${widget.food.price *  widget.food.discount!.toInt() / 100}',
                                style: const TextStyle(
                                  color: Colors.red,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.grey,
                                  fontSize: 9.0,
                                ),
                              ),
                            ),
                            Text('Item: ${widget.foodQuantity}'),
                          ],
                        ),
                        const CustomDivider(),
                        const Align(
                            alignment: Alignment.topLeft,
                            child: Text('Description',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black))),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            widget.food.description,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 23, 23, 23)),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Bottom Container Column with Text and Checkbox
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 50),
                              const Text(
                                'Choose your ingredients',
                                style: TextStyle(color: Colors.black, shadows: [
                                  Shadow(
                                    blurRadius: 5,
                                    color: Colors.black,
                                    offset: Offset(0, 2),
                                  )
                                ]),
                              ),
                              const SizedBox(height: 30),
                              Column(
                                children: preferences.map((preference) {
                                  return CheckboxListTile(
                                    title: Text(preference),
                                    value: selectedPreferences
                                        .contains(preference),
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if (value != null && value) {
                                          selectedPreferences.add(preference);
                                        } else {
                                          selectedPreferences
                                              .remove(preference);
                                        }
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                'Additional Preferences (up to 120 words)',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                controller: additionalPreferencesController,
                                maxLength: 120,
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText:
                                      'Enter any additional preferences here...',
                                ),
                              ),
                              const SizedBox(height: 100),
                              ElevatedButton(
                                onPressed: () {
                                  String additionalPreferences =
                                      additionalPreferencesController.text;
                                  String finalDescription =
                                      "${widget.food.description} ${selectedPreferences.join(", ")} $additionalPreferences";

                                  // Add to cart functionality here
                                  allfoodController.cartController
                                      .addToCart(widget.resturant, widget.food);
                                  allfoodController.cartController
                                      .showSnackBar(context,widget.foodQuantity);
                                  Navigator.pop(context);
                                  print(finalDescription);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(
                                      0xffE95322), // Button background color
                                  foregroundColor: Colors.white, // Text color
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10), // Button border radius
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16), // Button padding
                                  elevation: 3, // Button shadow
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.shopping_bag), // Icon
                                    SizedBox(
                                        width:
                                            8), // Space between icon and text
                                    Text(
                                      'Add to Cart', // Button text
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 50),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
