import 'package:flutter/material.dart';

import './widgets/txn_input.dart';
import './widgets/txn_list.dart';
import './models/txn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Cairo'
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
    // Txn(id: 't2', title: 'Shirts', amount: 2500, date: DateTime.now()),
    // Txn(id: 't3', title: 'Shoes', amount: 4000, date: DateTime.now()),
    // Txn(id: 't4', title: 'Restaurant', amount: 1000, date: DateTime.now()),
    // Txn(id: 't5', title: 'Fuel', amount: 2000, date: DateTime.now()),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
          backgroundColor: Colors.purple[600],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 250,
                child: Card(
                  color: Colors.grey[350],
                  child: Text('Chart'),
                  //elevation: 5,
                ),
              ),
              TxnList(_transactions),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white,),
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
