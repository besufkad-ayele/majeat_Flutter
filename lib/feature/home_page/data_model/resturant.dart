
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant_list.dart';

class RestaurantCategory {
  final String name;

  RestaurantCategory({required this.name});
}

class Restaurant {
  final int id;
  final String name;
  final String location;
   double rating;
  final String imageUrl;
  final List<Food> menu;
  final RestaurantCategory category;

  Restaurant({
    required this.id,
    required this.name,
    required this.location,
    required this.rating,
    required this.imageUrl,
    required this.menu,
    required this.category,

  });

  List<Food> getFavoriteItems() {
    return menu.where((food) => food.isFavorite).toList();
  }

  List<Food> addToCartFoods() {
    List<Food> cartedList = sampleRestaurants.cast<Food>();
    return cartedList.where((element) => element.isSelected == true).toList();
  }

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      rating: json['rating'],
      imageUrl: json['imageUrl'],
      menu: (json['menu'] as List).map((item) => Food.fromJson(item)).toList(),
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'rating': rating,
      'imageUrl': imageUrl,
      'menu': menu.map((food) => food.toJson()).toList(),
      'category': category,
    };
  }
}
