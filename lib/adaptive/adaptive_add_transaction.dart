import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveAddTransaction extends StatelessWidget {
  final String textAddTransaction;
  final VoidCallback handlerAddTransaction;

  const AdaptiveAddTransaction(
      this.textAddTransaction, this.handlerAddTransaction,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Platform.isIOS
          ? CupertinoButton(
              //onPressed: _addData,
              onPressed: handlerAddTransaction,
              child: Text(
                //'Add Transaction',
                textAddTransaction,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  //color: Theme.of(context).textTheme.button,
                  color: Color.fromARGB(255, 99, 32, 150),
                ),
                textAlign: TextAlign.center,
              ),
            )
          : ElevatedButton(
              //onPressed: _addData,
              onPressed: handlerAddTransaction,
              child: Text(
                //'Add Transaction',
                textAddTransaction,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  //color: Theme.of(context).textTheme.button,
                  color: Color.fromARGB(255, 99, 32, 150),
                ),
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
