import 'package:flutter/material.dart';

class TxnInput extends StatelessWidget {

  final titleInputController = TextEditingController();
  final amountInputCOntroller = TextEditingController();
  final descInputController = TextEditingController();
  
  @override 
  Widget build(BuildContext context) {
    return Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleInputController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountInputCOntroller,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Description'),
                      controller: descInputController,
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
                          onPressed: () {
                            print(titleInputController.text);
                            print(amountInputCOntroller.text);
                            print(descInputController.text);
                          },
                          color: Colors.purple[600],
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}