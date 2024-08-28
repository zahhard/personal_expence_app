import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTranaction extends StatelessWidget{
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTranaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return
      Card(
        child: Container(
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
              ),
              TextButton(
                onPressed: () {
                  addTx(titleController.text, double.parse(amountController.text));
                },
                child: Container(
                  color: Colors.green,
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
      );
  }

}