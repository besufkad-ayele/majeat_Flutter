// ignore: file_names
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:majeat/feature/cart/presentation/pages/cart_page.dart';
import 'package:majeat/feature/favorite/presentation/pages/favorite_page.dart';
// ignore: unused_import
import 'package:majeat/feature/helper/presentation/pages/helper_page.dart';
import 'package:majeat/feature/home_page/view/pages/home_page.dart';
import 'package:majeat/feature/profile/presentation/pages/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  //List of pages to be shown in the bottomnavigation bar
  final List<Widget> _pages = [
    const HomePage(),
    const FavoritePage(),
    const CartPage(),
     const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(181, 206, 177, 144),
      extendBody: true,
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(        
        backgroundColor : Colors.transparent,
        height: 50,
        color: Colors.black,
        buttonBackgroundColor:const Color.fromARGB(195, 8, 8, 8),
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        //items of icon name to be show respectivly to the pages
        items:const [
          Icon(Icons.home,color: Colors.white,),
          Icon(Icons.favorite,color: Colors.white,),
          Icon(Icons.local_grocery_store,color: Colors.white,),
          // Icon(Icons.headset_mic_rounded,color: Colors.white,),
          Icon(Icons.person_4_rounded,color: Colors.white,),
        ],
      ),
    );
  }
}








