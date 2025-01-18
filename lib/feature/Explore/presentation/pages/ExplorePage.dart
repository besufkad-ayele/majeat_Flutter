import 'package:flutter/material.dart';
import 'package:majeat/core/shared/widgets/exploreContainer.dart';
import 'package:majeat/feature/Explore/presentation/pages/Discount.dart';
import 'package:majeat/feature/Explore/presentation/pages/Drinks.dart';
import 'package:majeat/feature/Explore/presentation/pages/FastFoodPage.dart';
import 'package:majeat/feature/Explore/presentation/pages/LocalResturantPage.dart';
import 'package:majeat/feature/Explore/presentation/pages/traditionalPage.dart';
import 'package:majeat/feature/Search/presentation/pages/search_page.dart';

class ExplorePage extends StatefulWidget {
  final int index;
  const ExplorePage({super.key, required this.index});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late PageController _pageController;
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.index;
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(181, 206, 177, 144),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back),
              ),
              const Text('   '),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () {
                    print('Search clicked');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ),
                    );
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 7.0),
                        child: Row(
                          children: [
                            const Icon(Icons.mic, color: Colors.grey),
                            const SizedBox(width: 10),
                            Text(
                              'Search',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                padding: const EdgeInsets.only(left: 5, bottom: 5),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconWith_Label(
                        icon: Icons.discount_sharp,
                        label: 'Discount',
                        iconColor: Colors.red,
                        onTap: () => _onButtonPressed(0),
                        selected: _selectedIndex == 0, // Check if this item is selected
                      ),
                      const SizedBox(width: 10),
                      IconWith_Label(
                        icon: Icons.restaurant,
                        iconColor: Colors.green,
                        label: 'Local \nRestaurant',
                        onTap: () => _onButtonPressed(1),
                        selected: _selectedIndex == 1, // Check if this item is selected
                      ),
                     const SizedBox(width: 10),
                      IconWith_Label(
                        icon: Icons.shopping_cart,
                        iconColor: Colors.purple,
                        label: 'Traditional',
                        onTap: () => _onButtonPressed(2),
                        selected: _selectedIndex == 2, // Check if this item is selected
                      ),
                      const SizedBox(width: 10),
                      IconWith_Label(
                        icon: Icons.breakfast_dining_rounded,
                        iconColor: Colors.amber,
                        label: 'Fast Food',
                        onTap: () => _onButtonPressed(3),
                        selected: _selectedIndex == 3, // Check if this item is selected
                      ),
                      const SizedBox(width: 10),
                      IconWith_Label(
                        icon: Icons.coffee,
                        iconColor: Colors.amber,
                        label: 'Drinks',
                        onTap: () => _onButtonPressed(4),
                        selected: _selectedIndex == 4, // Check if this item is selected
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: const [
                DiscountPage(),
                Localresturantpage(),
                Traditionalpage(),
                FastFoodPage(),
                DrinksPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
