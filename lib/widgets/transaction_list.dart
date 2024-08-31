import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/Transaction.dart';

class TranslationList extends StatelessWidget{
  final List<Transaction> transactions;
  final Function deleteTx;

  TranslationList(this.transactions, this.deleteTx);


  @override
  Widget build(BuildContext context) {

    return Container(
      height: 700,
      child: transactions.isEmpty
          ? const Column(
        children: <Widget>[
          Text(
            'No transactions added yet!',
          ),
          SizedBox(
            height: 20,
          ),
        ],
      )
          : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: FittedBox(
                    child: Text('\$${transactions[index].amount}',),
                  ),
                ),
              ),
              title: Text(
                transactions[index].title,
              ),
              subtitle: Text(
                DateFormat.yMMMd().format(transactions[index].date),
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).primaryColorDark,
                onPressed: () => deleteTx(transactions[index].id),
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
