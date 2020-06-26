import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

import '../models/txn.dart';

class ExpenseChart extends StatelessWidget {
  final List<Txn> chartTxns;

  ExpenseChart(this.chartTxns);

  List<ChartData> get groupedData {
    return List.generate(7, (index){
      final date = DateTime.now().subtract(Duration(days: index));
      var totalExpense = 0.0;
      for(var i =0; i< chartTxns.length; i++){
        if(chartTxns[i].date.day == date.day && chartTxns[i].date.month == date.month && chartTxns[i].date.year == date.year ){
          totalExpense += chartTxns[i].amount;
        }
      }
      return ChartData(DateFormat.MMMd().format(date).toString(), totalExpense);
    });
  }
  
  @override 
  Widget build(BuildContext context) {
    List<charts.Series<ChartData, String>> series = [
      charts.Series(
        id: 'Expense',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: ( ChartData expenses,_) => expenses.date,
        measureFn: (ChartData expenses,_) => expenses.expense,
        data: groupedData,
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
    final String date;
    final double expense;

    ChartData(this.date, this.expense);
  }