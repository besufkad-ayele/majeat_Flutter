import 'package:flutter/material.dart';
import 'package:majeat/feature/allFoodallResturant/controller/allFood_controller.dart';

class Container_Custome extends StatelessWidget {
  const Container_Custome({
    super.key,
    required this.allfoodResturantController,
  });

  final AllfoodResturantController allfoodResturantController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allfoodResturantController.restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          final restaurant = allfoodResturantController.restaurants[index];
          return Container(
              width: 250,
              margin:const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                  restaurant.imageUrl,
                ),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: Column(
                  children: [
                    Image.network(restaurant.imageUrl,
                        height: 100, fit: BoxFit.cover),
                  const  SizedBox(height: 8.0),
                    Text(
                      restaurant.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Rating: ${restaurant.rating}',
                      style:const  TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
