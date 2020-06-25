import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/txn.dart';

class TxnList extends StatelessWidget {
 
  final List<Txn> _transactions = [
    Txn(id: 't1', title: 'Groceries', amount: 1000, date: DateTime.now()),
    Txn(id: 't2', title: 'Shirts', amount: 2500, date: DateTime.now()),
    Txn(id: 't3', title: 'Shoes', amount: 4000, date: DateTime.now()),
    // Txn(id: 't4', title: 'Restaurant', amount: 1000, date: DateTime.now()),
    // Txn(id: 't5', title: 'Fuel', amount: 2000, date: DateTime.now()),
  ];
  @override 
  Widget build(BuildContext context) {
    return Column(
                children: _transactions.map((txn) {
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
            }).toList());
  }
}