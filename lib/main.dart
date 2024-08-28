import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_expence_app/models/Transaction.dart';
import 'package:personal_expence_app/widgets/NewTransaction.dart';
import 'package:personal_expence_app/widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  final List<Transaction> transactions = [
    Transaction(id: '1', title: 'shoes', amount: 12.8, date: DateTime.now()),
    Transaction(id: '2', title: 'cloths', amount: 23.8, date: DateTime.now()),
    Transaction(id: '3', title: 'ball', amount: 55.44, date: DateTime.now()),
    Transaction(id: '4', title: 'glass', amount: 34.48, date: DateTime.now()),
  ];
  int _counter = 0;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Container (
                child: Text('Chart'),
                width: double.maxFinite,
                margin: const EdgeInsets.all( 10.0),
            ),
            elevation: 5,
          ),
          NewTranaction(),
          TranslationList()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
