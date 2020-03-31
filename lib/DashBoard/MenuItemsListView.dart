
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:happy_tax_man/DashBoard/MenuItemDesign.dart';
import 'package:happy_tax_man/Model/MenuModel.dart';


class MenuItemListView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 270,
      child: AnimationLimiter(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2.2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 1,
          ),
          //scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 875),
              columnCount: 2,
              child: FadeInAnimation(
                child: new MenuItemDesign(menuList[index]),
              ),
            );
          },
          itemCount: menuList.length,
        ),
      ),
    );


  }
}