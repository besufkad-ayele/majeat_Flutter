import 'package:flutter/material.dart';
import 'package:majeat/feature/Explore/Controller/explore_controller.dart';
import 'package:majeat/feature/Explore/presentation/widgets/ExploreCard.dart';
import 'package:provider/provider.dart';

class Localresturantpage extends StatelessWidget {
  const Localresturantpage({super.key});

  @override
  Widget build(BuildContext context) {
    ExploreController localresturantController = context.read<ExploreController>();
    final Localresturants = localresturantController.getLocalRestaurantFoodItems();
    return Localresturants.isEmpty ? const Center(child: Text('Local Resturant Empty'),):Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      margin: const EdgeInsets.only(top: 5, right: 5, left: 5),
      decoration:const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3 / 4,
            ),
            itemCount: Localresturants.length,
            itemBuilder: (context, index) {
               return ExploreItemCard(
                CardFood: Localresturants,
                index: index,
                GivenIcon: 'favorite',
              );   },
          ),
        ),
      ),
    );
 

  }
}