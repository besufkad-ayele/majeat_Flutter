
import 'package:flutter/material.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/feature/allFoodallResturant/controller/allFood_controller.dart';
import 'package:majeat/feature/cart/Controller/cart_controller.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:tuple/tuple.dart';

class ExploreController with ChangeNotifier{

  AppState appState;
  CartController cartController;
  AllfoodResturantController foodresturantController;

  ExploreController({required this.appState, required this.cartController, required this.foodresturantController});

// Method to filter items with discount greater than 0 and return both food and restaurant
  List<Tuple2<Restaurant, Food>> getItemsWithDiscountAndRestaurant() {
    List<Tuple2<Restaurant, Food>> itemsWithDiscountAndRestaurant = [];
    for (var restaurant in foodresturantController.restaurants) {
      for (var food in restaurant.menu) {
        if (food.discount! > 0) {
          itemsWithDiscountAndRestaurant.add(Tuple2(restaurant, food));
        }
      }
    }
    return itemsWithDiscountAndRestaurant;
  }

  // Method to list all food items with a specific category along with their restaurant
  List<Tuple2<Restaurant, Food>> getFoodItemsByCategory(String category) {
    List<Tuple2<Restaurant, Food>> foodItemsByCategory = [];
    for (var restaurant in foodresturantController.restaurants) {
      for (var food in restaurant.menu) {
        if (food.category.name.toLowerCase().contains(category.toLowerCase())) {
          foodItemsByCategory.add(Tuple2(restaurant, food));
        }
      }
    }
    return foodItemsByCategory;
  }

  // Method to list all local restaurant food items along with their restaurant
  List<Tuple2<Restaurant, Food>> getLocalRestaurantFoodItems() {
    return getFoodItemsByCategory('local');
  }

  // Method to list all fast food items along with their restaurant
  List<Tuple2<Restaurant, Food>> getFastFoodItems() {
    return getFoodItemsByCategory('FastFood');
  }

  List<Tuple2<Restaurant, Food>> getDrinkItems() {
    return getFoodItemsByCategory('drink');
  }

  // Method to list all traditional food items along with their restaurant
  List<Tuple2<Restaurant, Food>> getTraditionalFoodItems() {
    return getFoodItemsByCategory('Traditional');
  }

}