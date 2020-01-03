
import 'package:flutter/material.dart';
import 'package:happy_tax_man/DashBoard/MenuItemDesign.dart';
import 'package:happy_tax_man/Model/MenuModel.dart';


class MenuItemListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index){
          ///this is a list view builder which returns the view for each view
          return new  MenuItemDesign(menuList[index]);
        },
        itemCount: menuList.length,
      ),
    );


  }
}