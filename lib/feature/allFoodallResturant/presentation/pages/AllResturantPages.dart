import 'package:flutter/material.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';
import 'package:majeat/core/shared/widgets/blured_container.dart';
import 'package:majeat/core/shared/widgets/divder.dart';
import 'package:majeat/feature/allFoodallResturant/controller/allFood_controller.dart';
import 'package:majeat/feature/cart/presentation/pages/cart_page.dart';
import 'package:majeat/feature/favorite/presentation/pages/favorite_page.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/resturant%20detail.dart';
import 'package:provider/provider.dart';

class Allresturantpages extends StatelessWidget {
  const Allresturantpages({super.key});

  @override
  Widget build(BuildContext context) {
    AllfoodResturantController allfoodResturantController = Provider.of<AllfoodResturantController>(context);
    
    var items = allfoodResturantController.restaurants;
    return Scaffold(
      // backgroundColor: const Color.fromARGB(181, 206, 177, 144),
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
              'Resturants',
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
                  child:
                      const Text('❤', style: AppConstant.headingsubTitle),
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
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              RestaurantDetailPage(restaurant: items[index]),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlurredContainer(
                            margin: const EdgeInsets.all(AppConstant.defaultPadding),
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      items[index].imageUrl,
                                    ),
                                    fit: BoxFit.cover)),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                    alignment:
                                        const Alignment(-1, 1), // Bottom center
                                    child: Container(
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.7),
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(8))),
                                      padding:
                                          const EdgeInsets.only(right: 5, left: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            items[index].location,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  225, 11, 11, 11),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            items[index].category.name,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 109, 58, 0),
                                              fontSize: 8,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            )),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    items[index].name,
                                    style: AppConstant.headingStyle,
                                  ),
                                  Text(
                                    'Rating  ${items[index].rating} ⭐',
                                    style: const TextStyle(
                                      color: Colors.amber,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const CustomDivider(),
                      ],
                    ),
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
