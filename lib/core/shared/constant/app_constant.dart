import 'package:flutter/material.dart';

class AppConstant {
  // Colors
  static const Color primaryColor = Color.fromARGB(255, 228, 212, 154);
  static const Color secondaryColor = Color.fromARGB(254, 142, 138, 138);
  static const Color accentColor = Color(0xffef9920);
  static const Color btnColor = Color(0xffE95322);

  static const Color blackTextColor = Color.fromARGB(255, 0, 0, 0);
  static const Color bodyTextColor = Color(0xff868686);
  static const Color inputColor = Color(0xfffbfbfb);
  static const Color bakcGroundColor = Colors.white70;
  



  //Padding
  static const double defaultPadding =16;

  // Text Styles
  static const TextStyle headingStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: blackTextColor,
  );
    static const TextStyle headingsubTitle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: secondaryColor,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );

  // Strings
  static const String appName = 'Flutter Constants App';
  static const String welcomeMessage = 'Welcome to Flutter Constants App!';



  // Size
}
