import 'package:flutter/material.dart';
import 'package:majeat/feature/cart/Controller/cart_controller.dart';
import 'package:majeat/feature/cart/presentation/widgets/onActive.dart';
import 'package:majeat/feature/cart/presentation/widgets/oncart.dart';
import 'package:majeat/feature/cart/presentation/widgets/oncomplete.dart';
import 'package:majeat/feature/home_page/view/wigdets/tab_Item.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final appState = Provider.of<AppState>(context);
    CartController cartController = context.watch<CartController>();
    final cartItems = cartController.cart;
    // ignore: unused_local_variable
    int oncart =cartItems.length;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          
          title:  const Text(
            'CART',
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: const Color.fromARGB(218, 232, 169, 67),
                      ),
                      child: InkWell(
                        onTap: () {
                          print("Cart pressed");
                        },
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          ],
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromARGB(255, 226, 230, 200),
                ),
                child:  TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: const BoxDecoration(
                    color: Color.fromARGB(255, 209, 201, 59),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black54,
                  tabs: [
                    TabItem(title: 'Cart', count: cartController.getOnProgressItems().length),
                    TabItem(title: 'Active', count: cartController.getActiveItems().length),
                    TabItem(title: 'completed', count: cartController.getCompletedItems().length),
                  ],
                ),
              ),
            ),
          ),
        ),
        body:  const TabBarView(
          children: [
           Oncart(),
           onActive(),
            onComplete(),
          ],
        ),
      ),
    );
  }
}