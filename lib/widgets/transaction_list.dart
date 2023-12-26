/*
  this file will hold details of the transactions that we want to enter
*/

import 'package:expenses_app/adaptive/adaptive_list_text.dart';
import 'package:flutter/material.dart';

import '../adaptive/adaptive_list_item.dart';
import '../models/transaction.dart';

// ignore: must_be_immutable
class TransactionList extends StatelessWidget {
  List<Transaction> transactions;

  TransactionList(this.transactions, this.deleteTr, {super.key});

  final Function deleteTr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: transactions.isEmpty
          ? const AdaptiveListText('No Transaction Present!')
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Adaptive_List_Items(
                  transaction: transactions[index],
                  deleteTr: deleteTr,
                );
              },
              itemCount: transactions.length,
              // children: transactions.map(
              //   (transaction[index]) {
              //   },
              // ).toList(),
            ),
    );
  }
}



// video 34
