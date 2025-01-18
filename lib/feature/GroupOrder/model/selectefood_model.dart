import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/login/model/user_login.dart';

class SelectedFood {
  final Food food;
  final User user;

  SelectedFood({
    required this.food,
    required this.user,
  });
}