// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class SizeConfig {
//   static late double screenWidth;
//   static late double screenHeight;
//   static double? defaultSize;
//   static Orientation? orientation;
//   static const double defaultPaddingSize = 24.0;
//   static const double borderRadiusSize = 8.0;

//   static void init(BuildContext context) {
//     screenWidth = MediaQuery.sizeOf(context).width;
//     screenHeight = MediaQuery.sizeOf(context).height;
//   }
// }

// // Get the proportionate height as per screen size
// double getProportionateScreenHeight(double inputHeight) {
//   double screenHeight = SizeConfig.screenHeight;
//   // 812 is the layout height that designer use
//   return (inputHeight / 812.0) * screenHeight;
// }

// // Get the proportionate height as per screen size
// double getProportionateScreenWidth(double inputWidth) {
//   double screenWidth = SizeConfig.screenWidth;
//   // 375 is the layout width that designer use
//   return (inputWidth / 375.0) * screenWidth;
// }

// //this return the space between two children of a parent
// double getSpaceByHeight({double height = 15.0}) {
//   return getProportionateScreenHeight(height);
// }

// double getSpaceByWidth({double width = 5.0}) {
//   return getProportionateScreenWidth(width);
// }
