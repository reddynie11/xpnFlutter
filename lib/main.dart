import 'package:flutter/material.dart';

import './txn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Txn> transactions = [
    Txn(id: 't1', title: 'Groceries', amount: 1000, date: DateTime.now()),
    Txn(id: 't2', title: 'Shirts', amount: 2500, date: DateTime.now()),
    Txn(id: 't3', title: 'Shoes', amount: 4000, date: DateTime.now()),
    Txn(id: 't4', title: 'Restaurant', amount: 1000, date: DateTime.now()),
    Txn(id: 't5', title: 'Fuel', amount: 2000, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
          backgroundColor: Colors.red[400],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              child: Card(
                color: Colors.grey[350],
                child: Text('Chart'),
                elevation: 5,
              ),
            ),
            Column(children: transactions.map((txn) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1,),
                        borderRadius: BorderRadius.circular(2)
                      ),

                      child: Text(txn.amount.toString())),
                    Column(
                      children: <Widget>[
                        Text(txn.title),
                        Text(txn.date.toString()),
                      ],
                    ),
                  ],
                ),
              );
            }).toList()
            ),
          ],
        ),
      ),
    );
  }
}
