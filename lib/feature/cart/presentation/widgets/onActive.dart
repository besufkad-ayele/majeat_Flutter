import 'package:flutter/material.dart';
import 'package:majeat/feature/cart/Controller/cart_controller.dart';
import 'package:majeat/feature/cart/model/cart_model.dart';
import 'package:majeat/feature/cart/presentation/widgets/oncart.dart';
import 'package:majeat/feature/home_page/view/wigdets/noItem.dart';
import 'package:provider/provider.dart';

class onActive extends StatelessWidget {
  const onActive({super.key});

  @override
  Widget build(BuildContext context) {
    // final appState = Provider.of<AppState>(context);
    CartController cartController = context.watch<CartController>();
    List<CartItem> activeItems = cartController.getActiveItems();

    return activeItems.isNotEmpty
        ? SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  // Message of review
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Review and manage your Active items.',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.red[500],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // List of Cart Items
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: activeItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = activeItems[index];
                      return OnCartListtile(
                          cartItem: cartItem, cartController: cartController); },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          )
        : const noItem(
            Status: 'Active Cart Item',
          );
  }
}

