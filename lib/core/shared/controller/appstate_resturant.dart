import 'package:flutter/material.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/login/Provider_controller/login_controller.dart';

class AppState extends ChangeNotifier {
bool isok =false;
  LoginController logincontroller;
  AppState({
    required this.logincontroller,
  });
   void toggleFavorite(Food food) {
    food.isFavorite = !food.isFavorite;
    notifyListeners();
  }

  void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }


  


}
