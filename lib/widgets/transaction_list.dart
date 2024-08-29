import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/Transaction.dart';

class TranslationList extends StatelessWidget{
  final List<Transaction> transactions;
  TranslationList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Row(
                    children : <Widget>[
                      Container(
                        child: Text('\$ ${transactions[index].amount}',  style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20, color: Colors.indigo)),
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        decoration: BoxDecoration(border: Border.all(color: Colors.indigo, width: 2)),
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        children: <Widget>[
                          Text(transactions[index].title, style: TextStyle(fontWeight: FontWeight.bold , fontSize: 17, color: Colors.black)),
                          Text(transactions[index].date.toString(), style: TextStyle( fontSize: 15, color: Colors.grey))
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      )
                    ]
                )
            );
          },itemCount: transactions.length,)
    );

  }
}
