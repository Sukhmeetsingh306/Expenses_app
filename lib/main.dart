import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(const MyApp());

// void main() {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // SystemChrome.setPreferredOrientations(
//   //   [
//   //     DeviceOrientation.portraitUp,
//   //     DeviceOrientation.portraitDown,
//   //   ],
//   // ); // to fix rotation
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      color: Colors.purple,
      theme: ThemeData(
        // primarySwatch:  Color.fromRGBO(103, 58, 183, 1),
        //errorColor: const Color.fromARGB(255, 152, 57, 50),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(103, 58, 183, 1),
        ),
        useMaterial3: true,
        fontFamily:
            'Quicksand', // as to make this happen we had to add the font file in the pub yaml file and then and only we can add the font over here
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                color: Color.fromARGB(255, 99, 32, 150),
              ),
              //button: const TextStyle(color: Color.fromARGB(255, 99, 32, 150),),
            ), // as per this will make the all the input to make in same font as the other will
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(fontFamily: 'Quicksand', fontSize: 20),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    //userTransaction is the name not the widget
    // Transaction(
    //   id: 't1',
    //   title: 'Shoes',
    //   amount: 6300,
    //   date: DateTime.now(),
    // ),

    // Transaction(
    //   id: 't2',
    //   title: 'Jokey',
    //   amount: 1000,
    //   date: DateTime.now(),
    // ),

    // Transaction(
    //   id: 't3',
    //   title: 'Polo',
    //   amount: 5000,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't4',
    //   title: 'Sho',
    //   amount: 6300,
    //   date: DateTime.now(),
    // ),

    // Transaction(
    //   id: 't5',
    //   title: 'Jokey',
    //   amount: 1000,
    //   date: DateTime.now(),
    // ),

    // Transaction(
    //   id: 't6',
    //   title: 'Polo',
    //   amount: 5000,
    //   date: DateTime.now(),
    // ),

    // Transaction(
    //   id: 't7',
    //   title: 'Shoes',
    //   amount: 6300,
    //   date: DateTime.now(),
    // ),

    // Transaction(
    //   id: 't8',
    //   title: 'Jokey',
    //   amount: 1000,
    //   date: DateTime.now(),
    // ),

    // Transaction(
    //   id: 't9',
    //   title: 'Polo',
    //   amount: 5000,
    //   date: DateTime.now(),
    // )
    /* as per we will not make the card of the id as 
    per it is for making the difference between the the amount of transaction we will make */
  ];
  bool _showChart = false;

  List<Transaction> get _recentTransaction {
    // as per the private function of the class as per making the function to repeat itself as per making it in the get function
    return _userTransactions.where(
      (tx) {
        return tx.date.isAfter(
          DateTime.now().subtract(
            const Duration(days: 7),
          ),
        );
      },
    ).toList(); // as per this is use to convert the iterative to the list as the where function is the iterative not the list as per it cant be called upon
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );

    setState(
      () {
        _userTransactions.add(newTx);
      },
    );
  }

  // ignore: non_constant_identifier_names
  void _AddNewTransactions(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap:
              () {}, // this is for closing the widget by tapping on the screen
          child: NewTransaction(
            _addNewTransaction,
            behavior: HitTestBehavior.opaque,
          ),
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(
      () {
        _userTransactions.removeWhere(
          // remove where is the special command for the delete
          (tx) =>
              tx.id ==
              id, // this is the same way of doing it just in the simple way
          // (tx) {
          //   return tx.id == id;
          // },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final bool isLandscape;
    isLandscape = mediaQuery.orientation == Orientation.landscape;

    final dynamic appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: const Text(
              'Personal Expenses',
              style: TextStyle(
                color: Color.fromARGB(255, 99, 32, 150),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  child: const Icon(
                    CupertinoIcons.add,
                    // color: Color.fromARGB(255, 99, 32, 150),
                    shadows: <Shadow>[
                      Shadow(
                        color: Color.fromARGB(18, 50, 49, 47),
                        blurRadius: 15.0,
                      ),
                    ],
                  ),
                  onTap: () => _AddNewTransactions(context),
                )
              ],
            ),
          )
        : AppBar(
            title: const Text(
              'Personal Expenses',
              style: TextStyle(
                color: Color.fromARGB(255, 99, 32, 150),
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  _AddNewTransactions(context);
                },
                icon: const Icon(
                  Icons.add,
                  color: Color.fromARGB(255, 99, 32, 150),
                  shadows: <Shadow>[
                    Shadow(
                      color: Color.fromARGB(18, 50, 49, 47),
                      blurRadius: 15.0,
                    ),
                  ],
                ),
              )
            ],
          );

    final txListTransaction = SizedBox(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionList(
        _userTransactions,
        _deleteTransaction,
      ),
    );

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // isLandscape ? Row(
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Show Chart',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Switch.adaptive(
                    activeColor: const Color.fromARGB(255, 99, 32, 150),
                    value: _showChart,
                    onChanged: (val) {
                      setState(
                        () {
                          _showChart = val;
                        },
                      );
                    },
                  )
                ],
              ),

            if (!isLandscape)
              SizedBox(
                height: (mediaQuery.size.height -
                        appBar.preferredSize.height -
                        mediaQuery.padding.top) *
                    0.3,
                child: Chart(_recentTransaction),
              ),
            if (!isLandscape) txListTransaction,
            if (isLandscape)
              _showChart
                  ? SizedBox(
                      height: (mediaQuery.size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          0.7,
                      child: Chart(_recentTransaction),
                    )
                  : txListTransaction,
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: appBar,
            child: pageBody,
          )
        : Scaffold(
            appBar: appBar,
            body: pageBody,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => _AddNewTransactions(context),
                    child: const Icon(
                      Icons.add,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 99, 32, 150),
                        ),
                      ],
                    ),
                  ),
          );
  }
}

// video 19 chapter 5