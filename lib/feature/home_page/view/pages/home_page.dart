import 'package:flutter/material.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';
import 'package:majeat/core/shared/widgets/custom_floating_action_button.dart';
import 'package:majeat/core/shared/widgets/custom_inkwell.dart';
import 'package:majeat/core/shared/widgets/best_sellers.dart';
import 'package:majeat/core/shared/widgets/divder.dart';
import 'package:majeat/core/shared/widgets/reccomended.dart';
import 'package:majeat/feature/Explore/Controller/explore_controller.dart';
import 'package:majeat/feature/GroupOrder/presentation/pages/GroupOrderpage.dart';
import 'package:majeat/feature/Review/model/review_controller.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/AllFoodItemsPage.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/AllResturantPages.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:majeat/feature/home_page/view/wigdets/Aligned_text.dart';
import 'package:majeat/feature/Explore/presentation/pages/Explore_custome.dart';
import 'package:majeat/feature/home_page/view/wigdets/autoScrolle.dart';
import 'package:majeat/feature/home_page/view/wigdets/resturant_Grid_builder.dart';
import 'package:majeat/feature/home_page/view/wigdets/search_and_helper.dart';
import 'package:majeat/feature/home_page/view/wigdets/welcomeAndLocation.dart';
import 'package:majeat/feature/home_page/view/wigdets/welcome_text.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final appState = Provider.of<AppState>(context);

    ExploreController exploreController = context.read<ExploreController>();
    ReviewController reviewController = context.read<ReviewController>();

    final List<Tuple2<Restaurant, Food>> Best10food =
        reviewController.getTopRatedBestsellers();

    var size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
          alignment: const Alignment(1.2, 0.95),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GroupOrderPage(),
              ),
            );
          },
          BtnTitile: "Group\nOrder"),
      backgroundColor: AppConstant.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: const LocationAndUser(),
                ),
                Search_Helper_container(size: size),
                const SizedBox(height: 10),
                const WelcomeText(),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 18),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Aligned_text(
                        Text_Aligned: "Explore",
                        where: TextAlign.left,
                      ),
                      const SizedBox(height: 10),
                      const Explore(),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Aligned_text(
                              Text_Aligned: 'Best Sellers',
                              where: TextAlign
                                  .left), // In any other widget where you want to navigate to AllFoodItemsPage
                          CustomInkwell(
                            child: const Text(
                              'All Foods',
                              style: TextStyle(color: Colors.blue),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AllFoodItemsPage()),
                              );
                              //here navigate to the best sellers page
                            },
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < 4; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BestSellers(
                                  resturant: Best10food[i].item1,
                                  food: Best10food[i].item2,
                                  imageUrl: Best10food[i].item2.imageUrl,
                                  price: Best10food[i].item2.price.toString(),
                                  foodName: Best10food[i].item2.name,
                                  resturantName: Best10food[i].item1.name,
                                  rating: Best10food[i].item1.rating.toString(),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const CustomDivider(),
                      AutoScrollingImages(
                        exploreController: exploreController,
                      ),
                      const Aligned_text(
                          Text_Aligned:
                              'What on Your Mind!\n  Choose Your Resturants',
                          where: TextAlign.left),
                      resturant_Grid_Builder(
                          allfoodResturantController:
                              exploreController.foodresturantController),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Allresturantpages(),
                            ),
                          );
                        },
                        child: const Text('See More'),
                      ),
                      const CustomDivider(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AllFoodItemsPage()),
                                  );
                                },
                                child: CustomInkwell(
                                  child: const Text(
                                    'See All',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const AllFoodItemsPage()),
                                    );
                                    //here navigate to the best sellers page
                                  },
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < 4; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Reccomended(
                                  food: exploreController.foodresturantController
                                      .restaurants[i].menu[i],
                                  restaurant: exploreController
                                      .foodresturantController.restaurants[i],
                                ),
                              ),
                          ],
                        ),
                      ),
                      const CustomDivider(),
                      const SizedBox(height: 50)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
