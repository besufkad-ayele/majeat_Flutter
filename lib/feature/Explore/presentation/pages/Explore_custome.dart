import 'package:flutter/material.dart';
import 'package:majeat/core/shared/widgets/exploreContainer.dart';
import 'package:majeat/feature/Explore/presentation/pages/ExplorePage.dart';

class Explore extends StatelessWidget {
  const Explore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconWith_Label(
            icon: Icons.discount_sharp,
            label: 'Discount',
            iconColor: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExplorePage(index: 0,)),
              );
            },
          ),
          const SizedBox(width: 10),
          IconWith_Label(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const ExplorePage(index: 1,)),
                );
              },
              icon: Icons.restaurant,
              iconColor: Colors.green,
              label: 'Local \nRestaurant'),
         
          const SizedBox(
            width: 10,
          ),
          IconWith_Label(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const ExplorePage(index: 2,)),
                );
              },
              iconColor: Colors.purple,
              icon: Icons.shopping_cart,
              label: 'Traditional'),
          const SizedBox(
            width: 10,
          ),
          IconWith_Label(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const ExplorePage(index: 3,)),
                );
              },
              icon: Icons.breakfast_dining_rounded,
              iconColor: Colors.amber,
              label: 'Fast Food'),
        ],
      ),
    );
  }
}


