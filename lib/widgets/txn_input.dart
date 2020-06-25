import 'package:flutter/material.dart';

class TxnInput extends StatefulWidget {

  final Function addExpense;

  TxnInput(this.addExpense);

  @override
  _TxnInputState createState() => _TxnInputState();
}

class _TxnInputState extends State<TxnInput> {
  final titleInputController = TextEditingController();

  final amountInputController = TextEditingController();

  final descInputController = TextEditingController();

  void submitExpense() {
    final inputTitle = titleInputController.text;
    final inputAmount = double.parse(amountInputController.text);
    final inputDesc = descInputController.text;

    if(inputTitle.isEmpty || inputAmount <= 0){
      return;
    }
    widget.addExpense(inputTitle, inputAmount, inputDesc);
    Navigator.of(context).pop();
  }

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
                      onSubmitted: (_) => submitExpense(),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: amountInputController,
                      keyboardType: TextInputType.number,
                      //onSubmitted: (_) => submitExpense()
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Description'),
                      controller: descInputController,
                      //onSubmitted: (_) => submitExpense()
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
                          onPressed: submitExpense,
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