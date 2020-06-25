import 'package:flutter/material.dart';

import '../models/txn.dart';
import './txn_input.dart';
import './txn_list.dart';

class TxnContainer extends StatefulWidget {
  _TxnContainerState createState() => _TxnContainerState();
}

class _TxnContainerState extends State {
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
    return Column(
      children: <Widget>[
        TxnInput(_addExpense),
        TxnList(_transactions),
      ],
    );
  }
}
