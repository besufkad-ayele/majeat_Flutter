import 'package:flutter/material.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/core/shared/widgets/reccomended.dart';
import 'package:majeat/feature/favorite/Provider_controller/favoire_controller.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/food_detail.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Provider.of<FavoriteController>(context,listen: true);
    final favoriteItems = favoriteController.getFavoriteItemsWithRestaurants();
    AppState appState = Provider.of<AppState>(context);

   

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 206, 177, 144),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Favorites',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'You have ${favoriteItems.length} Favorite items',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red),
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite_sharp,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 4,
                top: 4,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '''It's time to buy your favorite dish.''',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          color: Colors.red[500]),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      // childAspectRatio:
                      //     1 / 1.2, // Adjusted aspect ratio for circular avatars
                    ),

                    itemCount: favoriteItems
                        .length, // Ensure there are at least 8 items to fill the grid
                    itemBuilder: (context, index) {
                      final food = favoriteItems[index].item2;
                      final restaurant = favoriteItems[index].item1;

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FoodDetail(
                                      resturant: restaurant,
                                      food: food,
                                    )),
                          );
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 200,
                                  height: 190,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey,
                                    image: DecorationImage(
                                        image: NetworkImage(food.imageUrl),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Positioned(
                                  top: 20, // Positioning at the bottom
                                  left: 20, // Positioned to the right
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                                107, 222, 222, 222)
                                            .withOpacity(
                                                0.7), // Adjust opacity as needed
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: InkWell(
                                        onTap: () {
                                          appState
                                              .toggleFavorite(food);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: food.isFavorite
                                              ? Colors.red
                                              : Colors.white,
                                        )),
                                  ),
                                ),
                                Positioned(
                                  top: 20, // Positioning at the bottom
                                  right: 20, // Positioned to the right
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                                107, 222, 222, 222)
                                            .withOpacity(
                                                0.7), // Adjust opacity as needed
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: InkWell(
                                        onTap: () {
                                          favoriteController.cartController
                                              .addToCart(
                                            Restaurant(
                                              id: restaurant.id,
                                              name: restaurant.name,
                                              location: restaurant.location,
                                              rating: restaurant.rating,
                                              category: restaurant.category,
                                              imageUrl: restaurant.imageUrl,
                                              menu: restaurant
                                                  .menu, // Add the menu items if needed
                                            ),
                                            Food(
                                              id: food.id,
                                              name: food.name,
                                              imageUrl: food.imageUrl,
                                              description: food.description,
                                              price: food.price,
                                              calories: food.calories,
                                              category: food.category,
                                            ),
                                          );
                                          favoriteController.cartController.showSnackBar(context, 1);
                                        },
                                        child: Icon(
                                          Icons.add_shopping_cart,
                                          color: food.isSelected
                                              ? Colors.green
                                              : Colors.white,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    ' ${food.name}',
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                      ' 💰${food.price}  . Calories ⚡${food.calories}',
                                      style: const TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Recommended',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            //here navigate to the best sellers page
                          },
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              'See All',
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Reccomended(
                              food: favoriteController.foodResturantController
                                  .restaurants[i].menu[i],
                              restaurant: favoriteController
                                  .foodResturantController.restaurants[i],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
