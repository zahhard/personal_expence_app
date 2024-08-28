import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Transaction.dart';

class TranslationList extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _TransactionList();

}

class _TransactionList extends State<TranslationList>{

  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'shoes', amount: 12.8, date: DateTime.now()),
    Transaction(id: '2', title: 'cloths', amount: 23.8, date: DateTime.now()),
    Transaction(id: '3', title: 'ball', amount: 55.44, date: DateTime.now()),
    Transaction(id: '4', title: 'glass', amount: 34.48, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: transactions.map((tx) {
          return Card(
              child: Row(
                  children : <Widget>[
                    Container(
                      child: Text('\$ ${tx.amount}',  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20, color: Colors.purple)),
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2)),
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      children: <Widget>[
                        Text(tx.title, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 17, color: Colors.black)),
                        Text(tx.date.toString(), style: TextStyle( fontSize: 15, color: Colors.grey))
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    )
                  ]
              )
          );
        }).toList(),);
  }
}
