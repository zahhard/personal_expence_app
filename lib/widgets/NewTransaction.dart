import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewTranaction extends StatefulWidget {
  final Function addTx;

  NewTranaction(this.addTx);

  @override
  State<StatefulWidget> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTranaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();


  void submitData (){
    final enterTitle = titleController.text;
    final enterAmount = double.parse(amountController.text);

    if (enterTitle.isEmpty || enterAmount<0){
      return;
    }
    widget.addTx(enterTitle, enterAmount);

    Navigator.of(context).pop();
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
              TextButton(
                onPressed: submitData,
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
