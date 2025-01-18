import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:majeat/core/shared/constant/app_constant.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/core/shared/widgets/custom_floating_action_button.dart';
import 'package:majeat/feature/cart/presentation/pages/cart_page.dart';
import 'package:majeat/feature/helper/presentation/pages/helper_page.dart';
import 'package:majeat/feature/login/presentation/pages/login.dart';
import 'package:majeat/feature/profile/presentation/pages/account_page.dart';
import 'package:majeat/feature/profile/presentation/pages/payment_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AppState appState = context.read<AppState>();
    final user = FirebaseAuth.instance.currentUser!;

    final String name = appState.logincontroller.signedinUser![0].name;
    final String emailOrPhone = appState.logincontroller.signedinUser![0].email;
    final String avatarUrl = appState.logincontroller.signedinUser![0].image;
    return Scaffold(
      backgroundColor: AppConstant.primaryColor,
      floatingActionButton: CustomFloatingActionButton(
        alignment: const Alignment(-1, -1),
        onPressed: () {
          Navigator.pop(context);
        },
        BtnTitile: "X",
        backgroundColor: const Color.fromARGB(255, 103, 103, 103),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Circular Avatar
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(avatarUrl),
              ),
              const SizedBox(height: 16),

              // Name
              Text(
                name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // Email or Phone
              Text(
                emailOrPhone,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 16),

              // List of Clickable Items
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('Account Settings'),
                    onTap: () {
                      // Navigate to Account Settings
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AccountPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.payment),
                    title: const Text('Payment Methods'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PaymentPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.history),
                    title: const Text('Order History'),
                    onTap: () {
                      // Navigate to Order
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CartPage()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Help & Support'),
                    onTap: () {
                      // Navigate to Help & Support
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Helperpage()),
                      );
                    },
                  ),
                  CustomFloatingActionButton(
                      alignment: Alignment.bottomCenter,
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      BtnTitile: ' LOG OUT'),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
