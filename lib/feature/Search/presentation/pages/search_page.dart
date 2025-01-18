import 'package:flutter/material.dart';
import 'package:majeat/feature/allFoodallResturant/controller/allFood_controller.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/food_detail.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/resturant%20detail.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController();
  final FocusNode _searchFocusNode = FocusNode();

  List<Food> _allFoods = [];
  List<Food> _filteredFoods = [];
  List<Restaurant> _allRestaurants = [];
  List<Restaurant> _filteredRestaurants = [];
  final List<bool> _isSelected = [true, false];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterLists);

    // Request focus after the widget tree is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchFocusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterLists);
    _searchController.dispose();
    _pageController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _filterLists() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _filteredFoods = List.from(_allFoods);
        _filteredRestaurants = List.from(_allRestaurants);
      });
    } else {
      setState(() {
        _filteredFoods = _allFoods.where((food) {
          return food.name.toLowerCase().contains(query);
        }).toList();
        _filteredRestaurants = _allRestaurants.where((restaurant) {
          return restaurant.name.toLowerCase().contains(query) ||
              restaurant.menu
                  .any((food) => food.name.toLowerCase().contains(query));
        }).toList();
      });
    }
  }

  void _goToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // final appState = Provider.of<AppState>(context, listen: false);
    AllfoodResturantController allfoodResturantController = context.read<AllfoodResturantController>();
    _allFoods =
        allfoodResturantController.restaurants.expand((restaurant) => restaurant.menu).toList();
    _allRestaurants = allfoodResturantController.restaurants;

    return Scaffold(
      // backgroundColor: const Color.fromARGB(181, 206, 177, 144),
      appBar: AppBar(
        // backgroundColor: const Color.fromARGB(181, 206, 177, 144),
        title: Padding(
          padding: const EdgeInsets.only(left:20.0),
          child: TextField(
            focusNode: _searchFocusNode,
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
            ),
            style: const TextStyle(color: Color.fromARGB(255, 45, 45, 45)),
            cursorColor: const Color.fromARGB(255, 40, 6, 6),
          ),
        ),
      ),
      body: Column(
        children: [



          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: ToggleButtons(
              isSelected: _isSelected,
              onPressed: (index) {
                setState(() {
                  for (int buttonIndex = 0;
                      buttonIndex < _isSelected.length;
                      buttonIndex++) {
                    _isSelected[buttonIndex] = buttonIndex == index;
                  }
                  _goToPage(index);
                });
              },
              color: Colors.black, // Text color when not selected
              selectedColor: Colors.white, // Text color when selected
              fillColor: const Color.fromARGB(255, 205, 162, 70), // Background color when selected
              borderRadius: BorderRadius.circular(10), // Rounded corners
              selectedBorderColor: const Color.fromARGB(255, 191, 229, 66), // Border color when selected
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('Foods'),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('Restaurants'),
                ),
              ],
            ),
          ),



          
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                _buildList(_filteredFoods),
                _buildListRestaurants(_filteredRestaurants),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List<Food> items) {
    return Column(
      children: [
        
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                      Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDetail(food: _filteredFoods[index],resturant: _filteredRestaurants[index],),
                  ),
                );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(107, 222, 222, 222).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(items[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                          color: const Color.fromARGB(255, 172, 133, 133),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 95, 95, 95)
                                  .withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                            BoxShadow(
                              color: const Color.fromARGB(255, 66, 65, 65)
                                  .withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 30,
                              offset: const Offset(0, 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(items[index].name),
                                Text(
                                    '\$${items[index].price.toStringAsFixed(2)}'),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              items[index].description,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildListRestaurants(List<Restaurant> items,) {
    return Column(
      children: [
    
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                   Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestaurantDetailPage(restaurant: _filteredRestaurants[index]),
                  ),
                );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(107, 222, 222, 222).withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(items[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                          color: const Color.fromARGB(255, 172, 133, 133),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 95, 95, 95)
                                  .withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                            BoxShadow(
                              color: const Color.fromARGB(255, 66, 65, 65)
                                  .withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 30,
                              offset: const Offset(0, 15),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(items[index].name),
                                Text(items[index].location),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Text(
                                  '🌟${items[index].rating}',
                                  style: const TextStyle(color: Colors.amber),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
