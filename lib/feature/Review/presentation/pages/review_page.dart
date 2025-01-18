import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';
import 'package:majeat/core/shared/widgets/custom_floating_action_button.dart';
import 'package:majeat/feature/Review/model/review_controller.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ReviewPage extends StatelessWidget {
  ReviewPage({
    super.key,
    required this.restaurant,
    required this.food,
  });
  final Restaurant restaurant;
  final Food food;
  double finalRate=5.0;
  @override
  Widget build(BuildContext context) {
    // final appState = Provider.of<AppState>(context);
ReviewController reviewController = context.read<ReviewController>();
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomFloatingActionButton(
            BtnTitile: "",
            alignment: const Alignment(-0.98, -0.9),
            onPressed: () {
              Navigator.pop(context);
            },
            iCons: Icons.close,
            backgroundColor: Colors.grey.withOpacity(0.5),
          ),
          CustomFloatingActionButton(
            BtnTitile: "❤🛒",
            alignment: const Alignment(0, -0.9),
            onPressed: () {
              // Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            leading: const Icon(Icons.add),
                            title: const Text('Add to Cart'),
                            onTap: () {
                              // appState.addToCart(restaurant, food);

                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.favorite),
                            title: const Text('Add to Favorites'),
                            onTap: () {
                              // appState.toggleFavorite(food);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  });
            },
            backgroundColor: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 229, 226, 226),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConstant.defaultPadding, vertical: 4),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppConstant.defaultPadding, vertical: 4),
              width: 500,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    alignment: const Alignment(0, 1),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        opacity: 0.6,
                        image: NetworkImage(restaurant.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      height: 70,
                      width: 100,
                      color: const Color.fromARGB(255, 73, 73, 73)
                          .withOpacity(0.5),
                    ),
                  ),
                  Container(
                    alignment: const Alignment(0, 5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: NetworkImage(food.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 150,
                      width: 200,
                    ),
                  ),
                ],
              ),
            ), // Adjust the space between the image and the text
            const SizedBox(height: 10),

            Row(
              children: [
                Text(
                  food.name,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                food.isFavorite
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
              ],
            ),
            const SizedBox(height: 10),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                            RatingBar.builder(
              // initialRating:  appState.restaurants[1].rating,
              initialRating: 1.5,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemPadding: const EdgeInsets.symmetric(horizontal: 5),
              itemBuilder: (context, _) => const Icon(
                    Icons.star_rate,
                    color: Colors.amber,
                  ),
              onRatingUpdate: (rating) {
                finalRate = rating;
              })
                          ]),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                food.description, // Assuming you have a description field
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            TextField(
              maxLines: 5,
              maxLength: 200,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Write your comment here...',
              ),
            ),
            CustomFloatingActionButton(
              alignment: Alignment.bottomCenter,
              onPressed: () {
                reviewController.updateRestaurantRating(
                    restaurant, finalRate);
              },
              width: 200,
              BtnTitile: 'Review',
              iCons: Icons.message,
            )
          ],
        ),
      ),
    );
  }
}
