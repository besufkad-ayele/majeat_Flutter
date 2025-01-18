import 'package:flutter/material.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/feature/allFoodallResturant/controller/allFood_controller.dart';
import 'package:majeat/feature/cart/Controller/cart_controller.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:tuple/tuple.dart';

class FavoriteController with ChangeNotifier{
  
   AppState appState;
   CartController cartController;
   AllfoodResturantController foodResturantController;

  FavoriteController( {
   required this.appState,
   required this.cartController,
   required this.foodResturantController,
  });

// can refernce for the method // or i can refernce to the resturant and make the method only for the favorite page
  // List<Tuple2<Restaurant, Food>> get favoriteResturant {
  //   return appState.getFavoriteItemsWithRestaurants();
  // }

   List<Tuple2<Restaurant, Food>> getFavoriteItemsWithRestaurants() {
    List<Tuple2<Restaurant, Food>> favoriteItemsWithRestaurants = [];

    for (var restaurant in foodResturantController.restaurants) {
      for (var food in restaurant.menu) {
        if (food.isFavorite) {
          favoriteItemsWithRestaurants.add(Tuple2(restaurant, food));
        }
      }
    }

    return favoriteItemsWithRestaurants;
  }

  



}


