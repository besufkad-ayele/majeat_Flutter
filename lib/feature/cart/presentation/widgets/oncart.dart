import 'package:flutter/material.dart';
import 'package:majeat/feature/allFoodallResturant/presentation/pages/food_detail.dart';
import 'package:majeat/feature/cart/Controller/cart_controller.dart';
import 'package:majeat/feature/Review/presentation/pages/review_page.dart';
import 'package:majeat/feature/cart/model/cart_model.dart';
import 'package:majeat/feature/home_page/view/wigdets/noItem.dart';
import 'package:provider/provider.dart';

class Oncart extends StatelessWidget {
  const Oncart({super.key});

  @override
  Widget build(BuildContext context) {
    // final appState = Provider.of<AppState>(context);
        CartController cartController = context.watch<CartController>();

    final cartItems = cartController.getOnProgressItems();

    return cartItems.isNotEmpty
        ? OnCart(cartItems: cartItems, cartController: cartController)
        : const noItem(
            Status: 'Active Cart Item',
          );
  }
}

class OnCart extends StatelessWidget {
  const OnCart({
    super.key,
    required this.cartItems,
    required this.cartController,
  });

  final CartController cartController;

  final List<CartItem> cartItems;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cart Items Section
            Container(
              padding: const EdgeInsets.only(left: 14, top: 14),
              decoration: const BoxDecoration(
                color: Color.fromARGB(124, 228, 228, 228),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  // Message of review
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Review and manage your cart items.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(187, 244, 67, 54),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // List of Cart Items
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartItems[index];
                      return OnCartListtile(
                          cartItem: cartItem, cartController: cartController);
                    },
                  ),
                  const SizedBox(height: 20),
                  // Total Price Section
                  Total(cartController: cartController),
                  const SizedBox(height: 20),
                  // Proceed to Checkout Button
                  CheckeOutButton(cartController: cartController),
                  const SizedBox(height: 55),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Total extends StatelessWidget {
  const Total({
    super.key,
    required this.cartController,
  });

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Total:',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$ ${cartController.calculateTotal()}',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}

class CheckeOutButton extends StatelessWidget {
  const CheckeOutButton({
    super.key,
    required this.cartController,
  });

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          print('Proceed to checkout');
          // CartController.appState.activateAllItems();
          cartController.activateAllItems();
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Center(
          child: Text(
            'Proceed to Checkout',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class OnCartListtile extends StatelessWidget {
  const OnCartListtile({
    super.key,
    required this.cartItem,
    required this.cartController,
  });

  final CartController cartController;
  final CartItem cartItem;


  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 20,
              offset: const Offset(0, 10), // changes position of shadow
            ),
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 30,
              offset: const Offset(0, 15), // changes position of shadow
            ),
          ]),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      margin: const EdgeInsets.only(left: 5, right: 15, bottom: 12),
      child: Row(
        children: [
          // Item Image
          InkWell(
            onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDetail(food: cartItem.food,resturant: cartItem.restaurant,),
                  ),
                );
            },
            child: Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(cartItem.food.imageUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1, 
                    blurRadius: 10,
                    offset: const Offset(0, 5), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 20,
                    offset: const Offset(0, 10), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 30,
                    offset: const Offset(0, 15), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Item Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Item Name and Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(cartItem.food.name),
                    Text(cartItem.restaurant.name),
                    Text(
                      '\$${cartItem.food.price.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 20, color: Colors.red[400]),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                // Item Description
                Text(
                  cartItem.food.description,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                // Item Status and Remove Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '✔ ${cartItem.status}',
                      style: const TextStyle(color: Colors.orange),
                      overflow: TextOverflow.ellipsis,
                    ),
                    cartItem.status == 'On Progress'
                        ? RemoveItem(cartController: cartController, cartItem: cartItem)
                        : Text(
                            'Total Item:  ${cartItem.quantity}   ⭐   Calories ⚡${cartItem.food.calories}',
                            style: const TextStyle(color: Colors.purple),
                          ),
                  ],
                ),
                const SizedBox(height: 10),
                // Shopify Icon and Quantity Control
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    cartItem.status == 'On Progress'
                        ? InkWell(
                            onTap: () {
                              cartController.toggleStateOnProgressToActive(
                                  cartItem.food);
                            },
                            child: const Icon(
                              Icons.shopify,
                              size: 20,
                              color: Colors.amber,
                            ),
                          )
                        : cartItem.status == 'Active'
                            ? CustomButton(
                                cartController: cartController,
                                cartItem: cartItem,
                                title: 'Cancle Order',
                                onTap: () {
                                  cartController.toggleStateActiveToOnprogress(
                                      cartItem.food);
                                },
                              )
                            : CustomButton(
                                cartController: cartController,
                                cartItem: cartItem,
                                title: 'Review Order⭐⭐⭐🌟',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ReviewPage(
                                        restaurant: cartItem.restaurant,
                                        food: cartItem.food,
                                      ),
                                    ),
                                  );
                                },
                              ),
    
                    // Quantity add and minus or Track Order wedget or Review wedget
                    cartItem.status == 'On Progress'
                        ? QuantityControl(
                            cartController: cartController, cartItem: cartItem)
                        : cartItem.status == 'Active'
                            ? CustomButton(
                                cartController: cartController,
                                cartItem: cartItem,
                                title: 'Deliverd',
                                onTap: () {
                                  print('here is the deliverd button');
                                  cartController.toggleStateActiveToCompleted(
                                      cartItem.food);
                                },
                              )
                            : CustomButton(
                                cartController: cartController,
                                cartItem: cartItem,
                                title: 'Order Again',
                                onTap: () {
    
                                  print('Order Again');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FoodDetail(food: cartItem.food,resturant: cartItem.restaurant,),
                                    ),);
                                },
                              ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
    
      required this.onTap,
      required this.cartItem,
      required this.title,
    required this.cartController,
  });

  final CartController cartController;

  final CartItem cartItem;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.amber[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}

class QuantityControl extends StatelessWidget {
  const QuantityControl({
    super.key,
    required this.cartItem,
    required this.cartController,
  });

  final CartController cartController;

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(107, 222, 222, 222).withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: () {
              cartController.decrementQuantity(cartItem.food);
            },
          ),
          Text('${cartItem.quantity}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          IconButton(
            onPressed: () {
              cartController.incrementQuantity(cartItem.food);
            },
            icon: const Icon(Icons.add),
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class RemoveItem extends StatelessWidget {
  const RemoveItem({
    super.key,
    required this.cartItem,    
    required this.cartController,
  });

  final CartController cartController;

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: const Color.fromARGB(107, 222, 222, 222).withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          cartController.removeFromCart(cartItem.food);
        },
        child: const Icon(
          Icons.remove_shopping_cart,
          color: Colors.red,
        ),
      ),
    );
  }
}
