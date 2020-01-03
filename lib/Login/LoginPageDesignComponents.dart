import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart' as prefix0;
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
waveView(){
  return Container(
    height: 750,
    child: RotatedBox(
      quarterTurns: 2,
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [Colors.deepPurple, Colors.deepPurple.shade200],
            [Colors.indigo.shade200, Colors.purple.shade200],
          ],
          durations: [19440, 10800],
          heightPercentages: [0.20, 0.25],
          blur: MaskFilter.blur(BlurStyle.solid, 10),
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
        waveAmplitude: 0,
        size: Size(
          double.infinity,
          double.infinity,
        ),
      ),
    ),
  );

}



formViewOne(IconData icon, String hint, TextInputType textInputType, bool obscure,  TextEditingController textEditingController, String initialValue, String newVar){
  return Card(
    margin: EdgeInsets.only(left: 30, right:30, top:30),
    elevation: 11,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
    child: Padding(
      padding: const EdgeInsets.only(
          left: 20.0, top: 2, bottom: 2),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.black26,),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black26),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
        ),
          keyboardType: textInputType,
          //controller: textEditingController,
          obscureText: obscure,
        cursorColor: prefix0.AppColors.color2,
        validator: (value) {
          if (value.isEmpty) {
            return formErrorText;
          }
          return null;
        },
//          onSaved: (value){
//            newVar = value;
//          },
      ),
    ),
  );
}



formViewTwo(IconData icon, String hint, TextInputType textInputType, bool obscure, TextEditingController textEditingController, String newVar){
  return Card(
    margin: EdgeInsets.only(left: 30, right:30, top:30),
    elevation: 11,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
    child: Padding(
      padding: const EdgeInsets.only(
          left: 20.0, top: 2, bottom: 2),
      child: TextFormField(
        decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.black26,),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.black26),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(40.0)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
        ),
        keyboardType: textInputType,
        controller: textEditingController,
        obscureText: obscure,
        cursorColor: prefix0.AppColors.color2,
        validator: (value) {
          if (value.isEmpty) {
            return formErrorText;
          }
          return null;
        },
//        onSaved: (value){
//          newVar = value;
//        },
      ),
    ),
  );
}