import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTranaction extends StatefulWidget {
  final Function addTx;

  NewTranaction(this.addTx);

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTranaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now() ;


  void submitData() {
    if (amountController.text.isEmpty) {
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return
      Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'title'),
                //onChanged: (val) => inputTitle = val,
                controller: titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'amount'),
                // onChanged: (val) => inputAmount = val,
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) =>  submitData,
              ),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Picked Date:     ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    TextButton(
                      onPressed: _presentDatePicker,
                      child: Container(
                        color: Colors.cyanAccent,
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: const Text(
                          'Flat Button',
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
               TextButton(
                  onPressed: submitData,
                 child: Container(
                   color: Colors.pinkAccent,
                   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                   child: const Text('Add Transaction',
                     style: TextStyle(color: Colors.white, fontSize: 13.0),
                   ),
                 ),
               ),

            ],
          ),
        ),
      );
  }

}
