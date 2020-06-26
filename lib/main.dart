import 'package:flutter/material.dart';

import './widgets/txn_input.dart';
import './widgets/txn_list.dart';
import './widgets/chart.dart';
import './models/txn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'Cairo'
          //accentColor: Colors.amber
          ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State {
  final List<Txn> _transactions = [
    Txn(id: 't1', title: 'Groceries', amount: 1000, date: DateTime.now()),
    Txn(id: 't2', title: 'Shirts', amount: 2500, date: DateTime.now()),
    Txn(id: 't3', title: 'Shoes', amount: 4000, date: DateTime.now()),
    Txn(id: 't4', title: 'Restaurant', amount: 1000, date: DateTime.now()),
    Txn(id: 't5', title: 'Fuel', amount: 2000, date: DateTime.now()),
    Txn(id: 't1', title: 'Groceries', amount: 1000, date: DateTime.now()),
    Txn(id: 't2', title: 'Shirts', amount: 2500, date: DateTime.now()),
    Txn(id: 't3', title: 'Shoes', amount: 4000, date: DateTime.now()),
    Txn(id: 't4', title: 'Restaurant', amount: 1000, date: DateTime.now()),
    Txn(id: 't5', title: 'Fuel', amount: 2000, date: DateTime.now()),
  ];

  void _addExpense(String title, double amount, String desc) {
    final newExpense = Txn(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString(),
        description: desc);
    setState(() {
      _transactions.add(newExpense);
    });
  }

  List<Txn> get recentTxns {
    return _transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: Colors.purple[600],
      ),
      body: SingleChildScrollView(
        child: _transactions.isEmpty
            ? Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('No Expense yet'),
                  ],
                ),
                width: double.infinity,
                height: 700,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 300,
                    padding: EdgeInsets.all(5),
                    child: Card(
                      child: Container(
                          padding: EdgeInsets.all(10), child: ExpenseChart(recentTxns)),
                      elevation: 5,
                    ),
                  ),
                  TxnList(_transactions),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return TxnInput(_addExpense);
            },
          );
        },
      ),
    );
  }
}
