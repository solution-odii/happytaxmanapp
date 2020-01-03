
import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Graph/ChartSetUp.dart';

/// the wallet design with the wallet balance displayed
///  ModelData.agentWalletDTO.accountBalance.toString()
Widget buildChartDesign(String text, double height) {
  return Container(
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      gradient: LinearGradient(colors: [AppColors.color5, AppColors.color1]),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: BarChart.withSampleData(),
      )
    ),
  );
}
