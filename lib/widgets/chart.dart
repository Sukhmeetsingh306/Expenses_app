import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './chart_bar.dart';
import 'package:intl/intl.dart';

/// In this file we will make the layout of the chart that how the chart will work

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;

  const Chart(this.recentTransaction, {super.key});

  List<Map<String, dynamic>> get groupTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );

        var totalSum = 0.0;

        for (var i = 0; i < recentTransaction.length; i++) {
          if (recentTransaction[i].date.day == weekDay.day &&
              recentTransaction[i].date.month == weekDay.month &&
              recentTransaction[i].date.year == weekDay.year) {
            totalSum += recentTransaction[i].amount;
          }
          //as per this is that it will compare the all of them as it will check that every step is right if any of the step is wrong it will give us the error
        }

        // print(DateFormat.E().format(weekDay));
        // print(totalSum);

        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    ).reversed.toList();
  }

  double get totalSpending {
    return groupTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
    // it allows us to change the list into aether type without making any kind of the changes the past methods
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionsValues);
    return Card(
        elevation: 5,
        margin: const EdgeInsets.all(20),
        child: Padding(
          // this work the same as that of the container if we only want to add the padding
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .spaceAround, // as per it is row it will work the opposite of that of the column
            children: groupTransactionValues.map(
              (data) {
                // return Text(data['day'] + ' : ' + data['amount'].toString(),);
                return Flexible(
                  // as permit will make the chart to not to change it space even when the amount exceeds
                  fit: FlexFit.tight,
                  child: ChartBar(
                    data['day'],
                    data['amount'],
                    //data['amount'] / totalSpending;  // it was still working as those but we had done this as per due to making it as t he security that notion should happen in future coding
                    //(data['amount'] as double) /  totalSpending,
                    totalSpending == 0.0
                        ? 0.0
                        : (data["amount"] as double) /
                            totalSpending, // we have added this because we were getting the error in the chart bar file of the height factor
                    // (IMPORTANT ERROR )This error occurs when your transaction list is empty. If your transaction list is empty dart evaluates that expression as 0 / 0 which is NaN. When you pass this NaN to the ChartBar heightFactor: spendingPctOfTotal it throws that error because heightFactor is expecting a value bigger then 0 or null (NaN is different from null).
                  ),
                );
              },
            ).toList(),
          ),
        ),
      );
  }
}
