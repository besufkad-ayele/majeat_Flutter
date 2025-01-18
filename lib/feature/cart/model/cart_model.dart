import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';

class CartItem {
  final String id; // Unique ID for the CartItem
  final Restaurant restaurant;
  final Food food;
   int quantity;
  String status;

  CartItem({
    required this.id,
    required this.restaurant,
    required this.food,
    this.quantity = 1,
    this.status = 'On Progress',
  });
}
