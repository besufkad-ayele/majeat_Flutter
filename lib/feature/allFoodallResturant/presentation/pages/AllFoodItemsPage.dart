import 'package:flutter/material.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/core/shared/widgets/divder.dart';
import 'package:majeat/feature/allFoodallResturant/controller/allFood_controller.dart';
import 'package:majeat/feature/cart/presentation/pages/cart_page.dart';
import 'package:majeat/feature/favorite/Provider_controller/favoire_controller.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:majeat/core/shared/widgets/blured_container.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/favorite/presentation/pages/favorite_page.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class AllFoodItemsPage extends StatelessWidget {
  const AllFoodItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AllfoodResturantController allfoodResturantController = context.read<AllfoodResturantController>();
    List<Tuple2<Restaurant, Food>> allFoodItems =
        allfoodResturantController.getAllFoodItemsWithRestaurants();

    return Scaffold(
      backgroundColor: const Color.fromARGB(133, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              'Foods',
              style: AppConstant.headingStyle,
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoritePage(),
                    ),
                  );
                },
                child: BlurredContainer(
                  backgroundColor: Colors.red.withOpacity(0.5),
                  padding: const EdgeInsets.all(8),
                  child: const Text('❤', style: AppConstant.headingsubTitle),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
                child: BlurredContainer(
                  backgroundColor: Colors.green.withOpacity(0.5),
                  padding: const EdgeInsets.all(8),
                  child: const Text('🛒', style: AppConstant.headingsubTitle),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: allFoodItems.length,
                itemBuilder: (context, index) {
                  final restaurant = allFoodItems[index].item1;
                  final food = allFoodItems[index].item2;

                  return CustomeCard(
                    food: food,
                    restaurant: restaurant,
                    Index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomeCard extends StatelessWidget {
  const CustomeCard({
    super.key,
    required this.food,
    required this.restaurant,
    required this.Index,
  });

  final Food food;
  final Restaurant restaurant;
  final int Index;
  @override
  Widget build(BuildContext context) {
FavoriteController favoriteController = context.watch<FavoriteController>();
AppState appState = Provider.of<AppState>(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            right: 20,
          ),
          margin: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // crossAxisAlignment: Index % 2 == 0? CrossAxisAlignment.start: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            food.name,
                            style: AppConstant.headingStyle,
                          ),
                          //optional can be removed
                          GestureDetector(
                            onTap: () {
                              appState.toggleFavorite(food);
                              appState.showSnackBar('Favorite Item', context);
                            },
                            child: Icon(
                              Icons.favorite,
                              color:
                                  food.isFavorite ? Colors.red : Colors.black45,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Rating: ${restaurant.rating.toString()} ⭐',
                        style: const TextStyle(color: Colors.amber),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Resturant : ${restaurant.name}",
                        style: AppConstant.headingsubTitle,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Discount %${food.discount}',
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: AppConstant.accentColor,
                            fontSize: 10),
                      ),
                      Text(
                        food.description,
                        style: const TextStyle(
                            fontSize: 16, color: AppConstant.bodyTextColor),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                // margin: EdgeInsets.symmetric(vertical: 50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(food.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                width: 200,
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          color: Colors.black.withOpacity(0.4)),
                    ),
                    Container(
                      alignment: const Alignment(
                          0.8, -0.8), // Use values between -1.0 and 1.0
                      child: BlurredContainer(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        child: Center(
                            child: GestureDetector(
                                onTap: () {
                                  appState.toggleFavorite(food);
                                  appState.showSnackBar(
                                      'Item Add to Favorite List', context);
                                },
                                child: Icon(Icons.favorite,
                                    color: food.isFavorite
                                        ? Colors.red
                                        : Colors.black))),
                      ),
                    ),
                    Container(
                      alignment:
                          const Alignment(0, 1.3), // Use values between -1.0 and 1.0
                      child: BlurredContainer(
                        width: 100,
                        height: 30,
                        backgroundColor:
                            const Color.fromARGB(183, 99, 99, 99).withOpacity(0.2),
                        child: Center(
                            child: GestureDetector(
                          onTap: () {
                            favoriteController.cartController.addToCart(restaurant, food);
                            favoriteController.appState.showSnackBar(
                                'Item Added To Cart', context);
                          },
                          child: const Text(
                            '🛒',
                            style: TextStyle(color: Colors.green),
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 2,
              ),
            ],
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}
