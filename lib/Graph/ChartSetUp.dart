import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:happy_tax_man/Constants/AppColors.dart';
class BarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  BarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory BarChart.withSampleData() {
    return new BarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(seriesList,
        animate: animate,
        domainAxis: new charts.OrdinalAxisSpec(
          renderSpec: new charts.SmallTickRendererSpec(
            labelStyle: new charts.TextStyleSpec(
              color: charts.MaterialPalette.white
            ),
            lineStyle: new charts.LineStyleSpec(
                color: charts.MaterialPalette.white
            ),

          ),


        ),
        // Configure the width of the pie slices to 60px. The remaining space in
        // the chart will be left as a hole in the center.
        );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, String>> _createSampleData() {
    final data = [
      new LinearSales("Expenses", 10000, AppColors.designColor5),
      new LinearSales("Income", 7095, AppColors.designColor7),

    ];

    return [
      new charts.Series<LinearSales, String>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.month,
        measureFn: (LinearSales sales, _) => sales.sales,
        colorFn: (LinearSales sales, _) => sales.color,
        //colorFn: (_, __) => charts.MaterialPalette.white,
        //measureFormatterFn: ,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final String month;
  final int sales;
  final charts.Color color;

  LinearSales(this.month, this.sales, Color color) : this.color = charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}