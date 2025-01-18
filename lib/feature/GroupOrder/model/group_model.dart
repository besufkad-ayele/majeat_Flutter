import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:majeat/feature/login/model/user_login.dart';
import 'package:tuple/tuple.dart';

class GroupOrder {
  final String GroupOrderid;
  final String name;
  final List<User> members;
  final Restaurant resturant;
  final DateTime createdAt;
  final DateTime orderEnd;
  final List<Tuple2<Food, User>> selectedFoods;
  final String paymentType; // Added field for payment type

  GroupOrder( {
    required this.resturant,
    required this.selectedFoods,
    required this.GroupOrderid,
    required this.name,
    required this.members,
    required this.createdAt,
    DateTime? orderEnd,
    Duration? duration,
    this.paymentType = "single", // Default payment type to 'single'
  }) : orderEnd = orderEnd ?? createdAt.add(duration ?? const Duration(hours: 5));
}
