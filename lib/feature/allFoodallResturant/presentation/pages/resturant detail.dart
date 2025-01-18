import 'package:flutter/material.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/core/shared/widgets/blured_container.dart';
import 'package:majeat/feature/allFoodallResturant/controller/allFood_controller.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/food_detail.dart';
import 'package:provider/provider.dart';

class RestaurantDetailPage extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    AllfoodResturantController allfoodResturantController =
        Provider.of<AllfoodResturantController>(context);
AppState appState = Provider.of<AppState>(context);
    return Scaffold(
      // backgroundColor: const Color.fromARGB(181, 206, 177, 144),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top image of restaurant page
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 30,
                    child: GestureDetector(
                      child: const BlurredContainer(
                          blurX: 10, blurY: 10, child: Icon(Icons.close)),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurant.name.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        restaurant.location,
                        style:
                            const TextStyle(fontSize: 18, color: Colors.green),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rating: ${restaurant.rating} ⭐',
                        style: const TextStyle(
                            fontSize: 16, color: Colors.amberAccent),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                        child: Text(
                          '👇  Menu ',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 214, 92),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // List tile for the menu part
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 5), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(0, 10), // changes position of shadow
                    ),
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 30,
                      offset: const Offset(0, 15), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: restaurant.menu.map((food) {
                    return ListTile(
                      leading: Image.network(food.imageUrl),
                      title: Text(food.name),
                      subtitle: Text(
                        food.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: food.isFavorite
                                ? const Icon(Icons.favorite, color: Colors.red)
                                : const Icon(Icons.favorite_border,
                                    color: Colors.white),
                            onPressed: () {
                              appState.toggleFavorite(food);
                              appState.showSnackBar(
                                  food.isFavorite
                                      ? 'Removed from favorites'
                                      : 'Added to favorites',
                                  context);
                            },
                          ),
                          IconButton(
                            icon: food.isFavorite
                                ? const Icon(Icons.shopping_bag,
                                    color: Colors.green)
                                : const Icon(Icons.shopping_bag,
                                    color: Colors.white),
                            onPressed: () {
                              allfoodResturantController.cartController
                                  .addToCart(restaurant, food);
                                  allfoodResturantController.cartController.showSnackBar(context, 1);
                            },
                          ),
                        ],
                      ),
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
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
