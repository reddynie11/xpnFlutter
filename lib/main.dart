import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './txn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Txn> transactions = [
    Txn(id: 't1', title: 'Groceries', amount: 1000, date: DateTime.now()),
    Txn(id: 't2', title: 'Shirts', amount: 2500, date: DateTime.now()),
    Txn(id: 't3', title: 'Shoes', amount: 4000, date: DateTime.now()),
    // Txn(id: 't4', title: 'Restaurant', amount: 1000, date: DateTime.now()),
    // Txn(id: 't5', title: 'Fuel', amount: 2000, date: DateTime.now()),
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
                //elevation: 5,
              ),
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Description'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        FlatButton(
                          child: Text('+ Add Reciept'),
                          onPressed: () {},
                          textColor: Colors.purple,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.purple,
                                  width: 2,
                                  style: BorderStyle.solid)),
                        ),
                        RaisedButton(
                          child: Text('Add Expense'),
                          onPressed: () {},
                          color: Colors.purple[600],
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Column(
                children: transactions.map((txn) {
              return Card(
                color: Colors.grey[200],
                child: Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'INR ${txn.amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.purple),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          txn.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMd().format(txn.date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList()),
          ],
        ),
      ),
    );
  }
}
