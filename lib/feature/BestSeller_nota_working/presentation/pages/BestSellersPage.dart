// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:majeat/feature/home_page/contoller/appstate_resturant.dart';
// import 'package:majeat/feature/home_page/data_model/food.dart';
// import 'package:majeat/feature/home_page/data_model/resturant.dart';
// import 'package:provider/provider.dart';
// import 'package:tuple/tuple.dart';

// class BestSellersPage extends StatefulWidget {
//   @override
//   _BestSellersPageState createState() => _BestSellersPageState();
// }

// class _BestSellersPageState extends State<BestSellersPage> {
//   int _selectedIndex = 0; // Index of the selected item

//   @override
//   Widget build(BuildContext context) {
//     final appState = Provider.of<AppState>(context);
//     final bestSellers = appState.getHighRatedRestaurantFoodItems();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Best Sellers'),
//       ),
//       body: Center(
//         child: Stack(
//           alignment: Alignment.bottomLeft,
//           children: [
//             ...bestSellers.asMap().entries.map((entry) {
//               int index = entry.key;
//               Tuple2<Restaurant, Food> item = entry.value;
//               Restaurant restaurant = item.item1;
//               Food food = item.item2;

//               return AnimatedPositioned(
//                 duration: Duration(milliseconds: 300),
//                 curve: Curves.easeInOut,
//                 left: 20.0,
//                 bottom: _selectedIndex == index ? 100 : 20 + (index * 20).toDouble(),
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       _selectedIndex = index;
//                     });
//                   },
//                   child: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     curve: Curves.easeInOut,
//                     width: _selectedIndex == index ? 350 : 300,
//                     height: _selectedIndex == index ? 500 : 200,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(restaurant.imageUrl),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.circular(20),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 10,
//                           offset: Offset(0, 5),
//                         ),
//                       ],
//                     ),
//                     child: _selectedIndex == index
//                         ? Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.black54,
//                             ),
//                             padding: EdgeInsets.all(20),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   restaurant.name,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   food.name,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   'Rating: ${restaurant.rating}',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   food.description,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   '\$${food.price}',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 22,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         : BackdropFilter(
//                             filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(20),
//                                 color: Colors.black38,
//                               ),
//                               padding: EdgeInsets.all(20),
//                               child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     restaurant.name,
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 24,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   SizedBox(height: 10),
//                                   Text(
//                                     'Tap for details',
//                                     style: TextStyle(
//                                       color: Colors.white70,
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                   ),
//                 ),
//               );
//             }).toList(),
//             if (_selectedIndex != -1) // Display the selected item on top right
//               Positioned(
//                 top: 20,
//                 right: 20,
//                 child: AnimatedContainer(
//                   duration: Duration(milliseconds: 300),
//                   curve: Curves.easeInOut,
//                   width: 350,
//                   height: 500,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.black54,
//                   ),
//                   padding: EdgeInsets.all(20),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Include the details of the selected restaurant and food item here
//                       // You can use the same widgets as the ones inside the AnimatedContainer above
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
