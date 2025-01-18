class FoodCategory {
  final String name;

  FoodCategory({required this.name});
}

class Food {
  final int id;
  final String name;
  bool isFavorite;
  bool isSelected;
  final String imageUrl;
  final String description;
  final double price;
  final int calories;
  final double? discount;
  final FoodCategory category;


  Food({
    required this.id,
    required this.name,
    this.isFavorite = false,
    this.isSelected= false,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.calories,
    this.discount = 0,
    required this.category,
  });

  // JSON serialization/deserialization methods
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
      isFavorite: json['isFavorite'],
      isSelected: json['isSelected'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: json['price'],
      calories: json['calories'],
      discount: json['discount'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'name': name,
      'isFavorite': isFavorite,
      'isSelected': isSelected,
      'imageUrl': imageUrl,
      'description': description,
      'price': price,
      'calories': calories,
      'discount': discount,
      'category':category,
    };
  }

}
