import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/SplashScreens/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primarySwatch: AppColors.color3,
          //fontFamily: 'Sofia Pro',
      ),
      home: SplashScreen(),
    );
  }
}

