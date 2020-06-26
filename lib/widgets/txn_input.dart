import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime _seletedDate;

  void submitExpense() {
    if (amountInputController.text == null) {
      return;
    }
    final inputTitle = titleInputController.text;
    final inputAmount = double.parse(amountInputController.text);
    final inputDesc = descInputController.text;

    if (inputTitle.isEmpty || inputAmount <= 0 || _seletedDate == null) {
      return;
    }
    widget.addExpense(inputTitle, inputAmount, inputDesc, _seletedDate);
    Navigator.of(context).pop();
  }

  void _openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _seletedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _seletedDate == null
                        ? 'Choose Date'
                        : 'Date: ${DateFormat.yMMMMd().format(_seletedDate)}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.date_range,
                      color: Colors.purple,
                    ),
                    onPressed: _openDatePicker),
              ],
            ),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton(
                    child: Text('+ Add Reciept'),
                    //onPressed: () {},
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
            ),
          ],
        ),
      ),
    );
  }
}
