import 'package:flutter/material.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/feature/cart/Controller/cart_controller.dart';
import 'package:majeat/feature/cart/model/cart_model.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:majeat/feature/home_page/data_model/resturant_list.dart';
import 'package:tuple/tuple.dart';

class  AllfoodResturantController with ChangeNotifier {
  AppState appState;
  CartController cartController;

  AllfoodResturantController(
      {required this.appState, required this.cartController});
  final List<Restaurant> _restaurants = sampleRestaurants;
  bool showAllRestaurants = false;
  List<Restaurant> get restaurants => _restaurants;

  List<Tuple2<Restaurant, Food>> getAllFoodItemsWithRestaurants() {
    List<Tuple2<Restaurant, Food>> allFoodItemsWithRestaurants = [];

    for (var restaurant in _restaurants) {
      for (var food in restaurant.menu) {
        allFoodItemsWithRestaurants.add(Tuple2(restaurant, food));
      }
    }

    return allFoodItemsWithRestaurants;
  }

  void toggleshowall(bool showAllRestaurants) {
    this.showAllRestaurants = showAllRestaurants;
    notifyListeners();
  }
  // void incrementQuantity(CartItem cartitem) {
  //     // Update the local state
  //     cartitem.quantity++;
  //   }

  //   void decrementQuantity(CartItem cartItem){
  //     if (cartItem.quantity > 0) {
  //       cartItem.quantity--;
  //     }
}

void incrementQuantitys(CartItem cartitem) {
  // Update the local state
  cartitem.quantity++;
}

void decrementQuantitys(double quantity) {
  if (quantity > 0) {
    quantity--;
  }
}
