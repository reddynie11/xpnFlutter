import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/txn.dart';

class TxnList extends StatelessWidget {
  final List<Txn> transactions;
  TxnList(this.transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      child: FittedBox(
                          child: Text(
                              'INR ${transactions[index].amount.toStringAsFixed(0)}'))),
                ),
                title: Text(
                  transactions[index].title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(transactions[index].date),
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            );
            //   return Card(
            //   color: Colors.grey[200],
            //   child: Row(
            //     children: <Widget>[
            //       Container(
            //           padding: EdgeInsets.all(10),
            //           margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //           decoration: BoxDecoration(
            //               border: Border.all(
            //                 color: Colors.purple,
            //                 width: 1,
            //               ),
            //               borderRadius: BorderRadius.circular(10)),
            //           child: Text(
            //             'INR ${transactions[index].amount.toStringAsFixed(0)}',
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 18,
            //                 color: Colors.purple),
            //           )),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           Text(
            //             transactions[index].title,
            //             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //           ),
            //           Text(
            //             DateFormat.yMMMd().format(transactions[index].date),
            //             style: TextStyle(color: Colors.grey),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // );
          },
          itemCount: transactions.length,
        ));
  }
}
