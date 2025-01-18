import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:majeat/core/shared/controller/appstate_resturant.dart';
import 'package:majeat/feature/Explore/Controller/explore_controller.dart';
import 'package:majeat/feature/GroupOrder/controller/group_order_controller.dart';
import 'package:majeat/feature/Review/model/review_controller.dart';
import 'package:majeat/feature/allFoodallResturant/controller/allFood_controller.dart';
import 'package:majeat/feature/cart/Controller/cart_controller.dart';
import 'package:majeat/feature/favorite/Provider_controller/favoire_controller.dart';
import 'package:majeat/feature/home_page/view/pages/MyHomePage.dart';
import 'package:majeat/feature/login/Provider_controller/login_controller.dart';
import 'package:majeat/firebase_options.dart';
import 'package:majeat/trial.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //
  //multiprovider with all the neccessary providers maintaing hierarchy
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppState(
            logincontroller: context.read<LoginController>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CartController(
            appState: context.read<AppState>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AllfoodResturantController(
            appState: context.read<AppState>(),
            cartController: context.read<CartController>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ReviewController(
            allfoodResturantController:
                context.read<AllfoodResturantController>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteController(
            appState: context.read<AppState>(),
            cartController: context.read<CartController>(),
            foodResturantController: context.read<AllfoodResturantController>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ExploreController(
            appState: context.read<AppState>(),
            cartController: context.read<CartController>(),
            foodresturantController: context.read<AllfoodResturantController>(),
          ),
        ),
         ChangeNotifierProvider(
          create: (context) => GroupOrderController(
            appState: context.read<AppState>(),
            cartController: context.read<CartController>(),
            foodresturantController: context.read<AllfoodResturantController>(),
          ),
        ),
      ],
      child: const MaterialApp(
        title: 'MAJEAT',
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
