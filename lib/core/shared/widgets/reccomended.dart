import 'package:flutter/material.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/core/shared/widgets/custom_inkwell.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/food_detail.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:provider/provider.dart';

class Reccomended extends StatelessWidget {
  final Food food;
  final Restaurant restaurant;

  const Reccomended({super.key, required this.food, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    AppState appState = context.watch<AppState>();
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetail(
                        food: food,
                        resturant: restaurant,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 140,
                  height: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(food.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
              ),
              Positioned(
                bottom: 10, // Positioning at the bottom
                right: 0, // Positioned to the right
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color:
                        Colors.red.withOpacity(0.7), // Adjust opacity as needed
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    food.price.toString(), // Replace with your price
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 50, // Positioning at the bottom
                left: 10, // Positioned to the right
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(126, 202, 199, 198)
                        .withOpacity(0.7), // Adjust opacity as needed
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 12,
                          color: Colors.amber,
                        ),
                        Text(
                          restaurant.rating
                              .toString(), // Replace with your food name
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 50, // Positioning at the bottom
                right: 10, // Positioned to the right
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        CustomInkwell(
                            onTap: () {
                              appState.toggleFavorite(food);
                            },
                            child:  Icon(Icons.favorite,color: food.isFavorite? Colors.red:Colors.grey,size: food.isFavorite? 30:16,))
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0, // Positioning at the bottom
                left: 10, // Positioned to the right
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(127, 209, 104, 72)
                        .withOpacity(0.7), // Adjust opacity as needed
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      food.name, // Replace with your food name
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16), // Add spacing between the Stack and the lab
      ],
    );
  }
}
