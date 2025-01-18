import 'package:flutter/material.dart';
import 'package:majeat/feature/allFoodallResturant/controller/allFood_controller.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/resturant%20detail.dart';

class resturant_Grid_Builder extends StatelessWidget {
  const resturant_Grid_Builder({
    super.key,
    required this.allfoodResturantController,
  });

  final AllfoodResturantController allfoodResturantController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 1.2, // Adjusted aspect ratio for circular avatars
      ),
      itemCount:  allfoodResturantController.restaurants.length>8?8: allfoodResturantController.restaurants.length, // Ensure there are at least 8 items to fill the grid
      itemBuilder: (context, index) {
        final restaurant = allfoodResturantController.restaurants[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    RestaurantDetailPage(restaurant: restaurant),
              ),
            );
          },
          child: GridTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(restaurant.imageUrl),
                ),
                const SizedBox(height: 8.0),
                Text(
                  restaurant.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
