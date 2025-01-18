
import 'package:flutter/material.dart';
import 'package:majeat/feature/allFoodallResturant/controller/allFood_controller.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:tuple/tuple.dart';

class ReviewController with ChangeNotifier{


AllfoodResturantController allfoodResturantController;
  ReviewController({
      required this.allfoodResturantController,
  });

    List<Tuple2<Restaurant, Food>> getHighRatedRestaurantFoodItems() {
    List<Tuple2<Restaurant, Food>> highRatedRestaurantFoodItems = [];
    for (var restaurant in allfoodResturantController.restaurants) {
      if (restaurant.rating > 3.5) {
        for (var food in restaurant.menu) {
          highRatedRestaurantFoodItems.add(Tuple2(restaurant, food));
        }
      }
    }
    return highRatedRestaurantFoodItems;
  }


List<Tuple2<Restaurant, Food>> getTopRatedBestsellers() {
    List<Tuple2<Restaurant, Food>> bestsellers = [];

    // Sort restaurants by rating in descending order
    List<Restaurant> sortedRestaurants = allfoodResturantController.restaurants.toList();
    sortedRestaurants.sort((a, b) => b.rating.compareTo(a.rating));

    // Iterate through sorted restaurants
    for (var restaurant in sortedRestaurants) {
      // Check if the restaurant has any menu items
      if (restaurant.menu.isNotEmpty) {
        // Get the top-rated food item from the restaurant's menu
        Food topRatedItem = restaurant.menu.first;

        // Add the restaurant and its top-rated item to the bestsellers list
        bestsellers.add(Tuple2(restaurant, topRatedItem));

        // Check if we have collected 10 bestsellers
        if (bestsellers.length >= 10) {
          break; // Stop iterating if we have 10 bestsellers
        }
      }
    }

    return bestsellers;
  }

 void updateRestaurantRating(Restaurant restaurant, double newRating) {
    // Find the existing restaurant in the list
    var existingRestaurantIndex = allfoodResturantController.restaurants.indexWhere(
      (item) => item.id == restaurant.id,
    );

    // If the restaurant is found, update its rating
    if (existingRestaurantIndex != -1) {
      allfoodResturantController.restaurants[existingRestaurantIndex].rating = newRating;
    } else {
      // If the restaurant is not found, optionally handle it (e.g., add it to the list or throw an error)
    }

    // Notify listeners about the changes
    notifyListeners();
  }

}