//
//import 'package:fcmb_agency_mobile/ChangePin/ChangePinScreen.dart';
//import 'package:fcmb_agency_mobile/Components/AssetStrings.dart';
//import 'package:fcmb_agency_mobile/Constants/Strings.dart';
//import 'package:fcmb_agency_mobile/Login/LoginScreen.dart';
//import 'package:fcmb_agency_mobile/Utils/Navigators.dart';
//import 'package:flutter/material.dart';
//import 'package:happy_tax_man/Login/LoginPage.dart';
//
//class RightMenuDesign extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//
//    // TODO: implement build
//    return Container(
//        padding: const EdgeInsets.only(top: 30, bottom: 450),
//        width: 200,
//        child: Drawer(
//          child: Container(
//            padding: const EdgeInsets.only(left: 16.0, right: 40),
//            decoration: BoxDecoration(
//                color: Colors.white,
//                boxShadow: [BoxShadow(color: Colors.black45)]),
//            width: 300,
//            child: Column(
//                  children: <Widget>[
//                    SizedBox(height: 30.0),
//
//                    /// the design of the navigation drawer menu
//                    _buildRow(assetImageAcctOpenIcon, changePinText, context,
//                        ChangePinScreen()),
//                    _buildDivider(),
//                    _buildRow(assetImageLogOutIcon, logOut, context,
//                        LoginPage()),
//
//                  ],
//                ),
//
//          ),
//        ),
//    );
//  }
//}
//
///// the design set for the menu item in the drawer
//Widget _buildRow(
//    String assetImage, String title, BuildContext context, Widget widget) {
//  return InkWell(
//    onTap: () {
//      navigateReplace(context, widget);
//    },
//    child: Container(
//      height: 40,
//      padding: const EdgeInsets.symmetric(vertical: 5.0),
//      child: Row(children: [
//        Image.asset(
//          assetImage,
//          height: 20,
//          width: 20,
//        ),
//        SizedBox(width: 10.0),
//        Text(
//          title,
//          style: textStyleSmallSemiBold,
//        ),
//      ]),
//    ),
//  );
//}
//
///// this method renders a line to separate each row in the column
//Divider _buildDivider() {
//  return Divider(
//    color: Colors.grey.shade400,
//  );
//}
