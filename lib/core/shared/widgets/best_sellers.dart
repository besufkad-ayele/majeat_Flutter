import 'package:flutter/material.dart';
import 'package:majeat/core/shared/widgets/blured_container.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/food_detail.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';

class BestSellers extends StatelessWidget {
  final String imageUrl;
  final String price;
  final String foodName;
  final String resturantName;
  final String rating;
  final Food food;
  final Restaurant resturant;
  const BestSellers({super.key, 
    required this.imageUrl,
    required this.price,
    required this.foodName,
    required this.resturantName,
    required this.rating, required this.food, required this.resturant,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    FoodDetail(food: food,resturant: resturant,),));
      },
      child: BlurredContainer(
        backgroundColor: Colors.grey.withOpacity(0.001),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                ),
                Positioned(
                  bottom: 10, // Positioning at the bottom
                  right: 0, // Positioned to the right
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color:
                          Colors.red.withOpacity(0.7), // Adjust opacity as needed
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      price, // Replace with your price
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 16
            ), // Add spacing between the Stack and the label
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                foodName, // Replace with your food name
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              resturantName, // Replace with your location
              style: const TextStyle(
                fontSize: 8,
                color: Colors.black54,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      " $rating",
                      style: const TextStyle(fontSize: 12),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 8,
                    ),
                    const SizedBox(
                      width: 10
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.favorite,
                          size: 8,
                          color: Colors.amber,
                        )),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
