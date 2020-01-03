import 'package:flutter/material.dart';

Map<int, Color> color =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};

class AppColors{

  static final Color color1 = Color(0xff222535);

  static final MaterialColor color3 = MaterialColor(0xff222535, color);
  static final MaterialColor color4 = MaterialColor(0xffDD8705, color);

  static final Color color2 = Color(0xffDD8705);

  static final Color color5 = Colors.deepPurple.shade300;


  static final designColor5 = const Color(0xfffdd8d9);
  static final designColor6 = const Color(0xffd90d16);

  static final designColor7 = const Color(0xffe0fff6);
  static final designColor8 = const Color(0xff25ae88);





}