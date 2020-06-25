import 'package:flutter/material.dart';

import './txn_input.dart';
import './txn_list.dart';

class TxnContainer extends StatefulWidget {
  _TxnContainerState createState() => _TxnContainerState();
}

class _TxnContainerState extends State {
  @override 
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TxnInput(),
        TxnList(),
      ],
    );
  }
}