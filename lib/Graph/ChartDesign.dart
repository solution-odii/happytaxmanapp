
import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Graph/BarChartSetUp.dart';
import 'package:happy_tax_man/Graph/StackedLineChartSetUp.dart';

/// the wallet design with the wallet balance displayed

Widget buildChartDesign(String text, double height) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      //gradient: LinearGradient(colors: [AppColors.color5, AppColors.color1]),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: StackedAreaLineChart.withSampleData(),
      )
    ),
  );
}
