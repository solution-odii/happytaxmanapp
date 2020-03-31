
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Model/MenuModel.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';
import 'package:happy_tax_man/Utils/Styles.dart';


class MenuItemDesign extends StatelessWidget{
  final MenuModel menuModel;

  MenuItemDesign(this.menuModel);
  /// This is the design for each content on the popular transactions view
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: (){
            navigatePush(context, menuModel.widget);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(5),
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Container(
              width: 160,
              height: 90,
              decoration: BoxDecoration(
                  color: menuModel.color,
                  //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(20),
                  ),
                  border: Border.all(color: Colors.grey.withOpacity(.30))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[

                    Row(
                      children: <Widget>[
                        Text(menuModel.title, style: textStyleSmalMedium,)
                      ],
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(menuModel.icon, color: AppColors.color1,),
                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 20,)
      ],

    );
  }
}







//class MenuItemDesign extends StatelessWidget{
//  final MenuModel menuModel;
//
//  MenuItemDesign(this.menuModel);
//  /// This is the design for each content on the popular transactions view
//  @override
//  Widget build(BuildContext context) {
//
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//      children: <Widget>[
//        InkWell(
//          onTap: (){
//            navigatePush(context, menuModel.widget);
//          },
//          child: Column(
//            children: <Widget>[
//              Container(
//                width: 60,
//                height: 60,
//                decoration: BoxDecoration(
//                    color: Colors.grey.withOpacity(.20),
//                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
//                    border: Border.all(color: Colors.grey.withOpacity(.30))
//                ),
//                child: Center(
//                  child: Icon(menuModel.icon, color: AppColors.color1,),
//                ),
//              ),
//              Text(menuModel.title, style: textStyleSmalMedium,)
//            ],
//          ),
//        ),
//
//        SizedBox(width: 20,)
//      ],
//
//    );
//  }
//}