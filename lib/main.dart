import 'package:flutter/material.dart';

import './widgets/txn_ctnr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
          backgroundColor: Colors.red[400],
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
              TxnContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
