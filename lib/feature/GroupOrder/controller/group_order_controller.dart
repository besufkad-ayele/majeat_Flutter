import 'package:flutter/material.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/feature/allFoodallResturant/controller/allFood_controller.dart';
import 'package:majeat/feature/cart/Controller/cart_controller.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/login/model/user_login.dart';
import 'package:tuple/tuple.dart';

class GroupOrderController with ChangeNotifier{
    
  AppState appState;
  CartController cartController;
  AllfoodResturantController foodresturantController;

  GroupOrderController({required this.appState, required this.cartController, required this.foodresturantController});




    void addToSelectedFoods(Food food, User defaultUser ,List<Tuple2<Food, User>> selectedFoods) {

      selectedFoods.add(Tuple2(food, defaultUser));
      notifyListeners();
    
  }
}