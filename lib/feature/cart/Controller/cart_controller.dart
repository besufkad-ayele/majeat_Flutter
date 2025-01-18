import 'package:flutter/material.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/feature/cart/model/cart_model.dart';
import 'package:majeat/feature/home_page/data_model/food.dart';
import 'package:majeat/feature/home_page/data_model/resturant.dart';
import 'package:uuid/uuid.dart';

class CartController with ChangeNotifier{

  AppState appState;
  CartController({required this.appState});


  List<CartItem> get cart => _cart;

    final List<CartItem> _cart = [];
  
 void showSnackBar(BuildContext context, int quantity) {
      ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Successfully Added to Cart 🛒'),
                      backgroundColor: const Color.fromARGB(255, 140, 255, 0),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'Close',
                        textColor: Colors.white,
                        onPressed: () {
                          // Code to execute.
                        },
                      ),
                    ),
                  );
    }
      int getCartQuantity(int foodId, int restaurantId) {
    int totalQuantity = 0;
    for (var item in cart) {
      if (item.food.id == foodId &&
          item.restaurant.id == restaurantId &&
          item.status == 'on Progress') {
        totalQuantity += item.quantity;
      }
    }
    return totalQuantity;
  }

        void addToCart(Restaurant restaurant, Food food, {int quantity = 1}) {
    // Find the existing cart item or create a new one if not found
    var existingItem = _cart.firstWhere(
      (item) =>
          item.food.id == food.id &&
          item.restaurant.id == restaurant.id &&
          item.status == 'On Progress',
      orElse: () => CartItem(
          id: const Uuid().v4(), restaurant: restaurant, food: food, quantity: 0),
    
    );

    if (_cart.contains(existingItem) &&
        existingItem.food.id == food.id &&
        existingItem.restaurant.id == restaurant.id &&
        existingItem.status == 'On Progress') {
      // If the item already exists in the cart, increase its quantity by the specified amount
      existingItem.quantity += quantity;
    } else {
      // If the item does not exist, set its quantity to the specified amount and add it to the cart
      existingItem.quantity = quantity;
      _cart.add(existingItem);
    }

    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.removeWhere((item) => item.food == food);
    notifyListeners();
  }

  void incrementQuantity(Food food) {
    var existingItem = _cart.firstWhere((item) => item.food == food);
    existingItem.quantity++;
    notifyListeners();
  }

  void decrementQuantity(Food food) {
    var existingItem = _cart.firstWhere((item) => item.food == food);
    if (existingItem.quantity > 1) {
      existingItem.quantity--;
    } else {
      _cart.remove(existingItem);
    }
    notifyListeners();
  }

 
  void toggleStateOnProgressToActive(Food food) {
    var existingItem = _cart.firstWhere((item) => item.food == food);
    if (existingItem.status == 'On Progress') {
      existingItem.status = 'Active';
    }
    notifyListeners();
  }

  void toggleStateActiveToOnprogress(Food food) {
    var existingItem = _cart.firstWhere((item) => item.food == food);
    if (existingItem.status == 'Active') {
      existingItem.status = 'On Progress';
    }
    notifyListeners();
  }

  void toggleStateActiveToCompleted(Food food) {
    var existingItem = _cart.firstWhere((item) => item.food == food);
    if (existingItem.status == 'Active') {
      existingItem.status = 'Completed';
    }
    notifyListeners();
  }

  void toggleStateCompletedToArchived(Food food) {
    var existingItem = _cart.firstWhere((item) => item.food == food);
    if (existingItem.status == 'Completed') {
      existingItem.status = 'Archived';
    }
    notifyListeners();
  }

  void changeOrderStatus(Food food, String status) {
    var existingItem = _cart.firstWhere((item) => item.food == food);
    existingItem.status = status;
    notifyListeners();
  }

  List<CartItem> getActiveItems() {
    return _cart.where((item) => item.status == 'Active').toList();
  }

  List<CartItem> getCompletedItems() {
    return _cart.where((item) => item.status == 'Completed').toList();
  }

  List<CartItem> getOnProgressItems() {
    return _cart.where((item) => item.status == 'On Progress').toList();
  }

    double calculateTotal() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      if (cartItem.status == 'On Progress') {
        // Get the food item associated with the cart item
        Food food = cartItem.food;

        // Calculate the total price for the cart item (quantity * price)
        double itemTotal = food.price * cartItem.quantity;

        // Add the total price of the current item to the overall total
        total += itemTotal;
      }
    }
    return total;
  }

  void activateAllItems() {
    for (CartItem cartItem in _cart) {
      if (cartItem.status == 'On Progress') {
        cartItem.status = 'Active';
      }
    }
    notifyListeners();
  }
}