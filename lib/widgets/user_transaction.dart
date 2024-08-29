import 'package:flutter/cupertino.dart';
import 'package:personal_expence_app/widgets/transaction_list.dart';

import '../models/Transaction.dart';
import 'NewTransaction.dart';

class UserTransaction extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _UsetTransaction();
}


class _UsetTransaction extends State<UserTransaction>{

  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'shoes', amount: 12.8, date: DateTime.now()),
    Transaction(id: '2', title: 'cloths', amount: 23.8, date: DateTime.now()),
    Transaction(id: '3', title: 'ball', amount: 55.44, date: DateTime.now()),
    Transaction(id: '4', title: 'glass', amount: 34.48, date: DateTime.now()),
    Transaction(id: '3', title: 'ball', amount: 55.44, date: DateTime.now()),
    Transaction(id: '4', title: 'glass', amount: 34.48, date: DateTime.now()),
    Transaction(id: '3', title: 'ball', amount: 55.44, date: DateTime.now()),
    Transaction(id: '4', title: 'glass', amount: 34.48, date: DateTime.now()),
    Transaction(id: '3', title: 'ball', amount: 55.44, date: DateTime.now()),
    Transaction(id: '4', title: 'glass', amount: 34.48, date: DateTime.now())
  ];

  void addTransaction(String title, double amount){
    final newTx =  Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id:DateTime.now().toString()
    );

    setState((){
      transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(children: <Widget>[
        NewTranaction(addTransaction),
        TranslationList(transactions)
      ],);
  }
}