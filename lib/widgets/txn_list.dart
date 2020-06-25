import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/txn.dart';

class TxnList extends StatelessWidget {
  final List<Txn> transactions;
  TxnList(this.transactions);
  @override 
  Widget build(BuildContext context) {
    return Column(
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
            }).toList());
  }
}