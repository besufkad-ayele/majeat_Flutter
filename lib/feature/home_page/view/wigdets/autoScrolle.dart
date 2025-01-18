import 'dart:async';
import 'package:flutter/material.dart';
import 'package:majeat/core/shared/widgets/blured_container.dart';
import 'package:majeat/feature/Explore/Controller/explore_controller.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/food_detail.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:tuple/tuple.dart';

class AutoScrollingImages extends StatefulWidget {
  final ExploreController exploreController;
  const AutoScrollingImages({super.key, required this.exploreController});

  @override
  _AutoScrollingImagesState createState() => _AutoScrollingImagesState();
}

class _AutoScrollingImagesState extends State<AutoScrollingImages> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;
  List<String> _imageUrls = []; // Holds the list of image URLs
  List<Tuple2<Restaurant, Food>> discountList = [];
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_scrollController.hasClients) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        double currentScrollPosition = _scrollController.position.pixels;

        if (currentScrollPosition < maxScrollExtent) {
          _scrollController.animateTo(
            currentScrollPosition + 200, // Scroll increment value
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            0.0, // Scroll back to the start
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
        }
      }
    });
    discountList = widget.exploreController.getItemsWithDiscountAndRestaurant();
    // Initialize image URLs using appState
    _imageUrls = discountList.map((item) => item.item2.imageUrl).toList();
  }

  void _scrollListener() {
    double currentScrollPosition = _scrollController.position.pixels;
    double maxScrollExtent = _scrollController.position.maxScrollExtent;
    int newIndex =
        (currentScrollPosition / (maxScrollExtent / (_imageUrls.length - 1)))
            .round();
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200, // Adjust height as needed
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: _imageUrls.length,
            itemBuilder: (context, index) {
              Restaurant restaurant = discountList[index].item1;
              Food food = discountList[index].item2;

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FoodDetail(
                        resturant: restaurant,
                        food: food,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.all(18.0),
                  padding: const EdgeInsets.only(left: 18.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: NetworkImage(_imageUrls[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // BlurredContainer at bottom left
                      Container(
                        alignment: const Alignment(1.1, 1.1),
                        child: BlurredContainer(
                          blurX: 20,
                          blurY: 20,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(0),
                                  bottomRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(0))),
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              restaurant.name +
                                  '  You Have ' +
                                  food.discount.toString() +
                                  "%  ",
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),
                        ),
                      ),
                      // Icon at top left
                      Container(
                        alignment: const Alignment(-1.1, -1),
                        child: BlurredContainer(
                          backgroundColor: Colors.grey.withOpacity(0.5),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.discount_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 6,
        ), // Space between the images and the indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_imageUrls.length, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: 2.0,
              height: 2.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? const Color.fromARGB(255, 243, 211, 4)
                    : const Color.fromARGB(105, 220, 218, 104),
              ),
            );
          }),
        ),
      ],
    );
  }
}
