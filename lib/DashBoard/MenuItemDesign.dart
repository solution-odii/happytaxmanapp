
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
          child: Column(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.20),
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    border: Border.all(color: Colors.grey.withOpacity(.30))
                ),
                child: Center(
                  child: Icon(menuModel.icon, color: AppColors.color1,),
                ),
              ),
              Text(menuModel.title, style: textStyleSmalMedium,)
            ],
          ),
        ),

        SizedBox(width: 20,)
      ],

    );
  }
}