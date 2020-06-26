import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ExpenseChart extends StatelessWidget {
  final List<ChartData> chartTxns = [
    ChartData('May 21', 1500),
    ChartData('May 22', 1100),
    ChartData('May 23', 10),
    ChartData('May 24', 100),
    ChartData('May 25', 200),
    ChartData('May 26', 5000),
    ChartData('May 26', 12000)
  ];
  
  @override 
  Widget build(BuildContext context) {
    List<charts.Series<ChartData, String>> series = [
      charts.Series(
        id: 'Expense',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: ( ChartData expenses,_) => expenses.year,
        measureFn: (ChartData expenses,_) => expenses.expense,
        data: chartTxns,
        labelAccessorFn: (ChartData expenses,_) => '${expenses.expense}'
                
      )
    ];  
    return new charts.BarChart(
      series,
      barRendererDecorator: new charts.BarLabelDecorator<String>()
    );
  }

  
} 

class ChartData {
    final String year;
    final int expense;

    ChartData(this.year, this.expense);
  }