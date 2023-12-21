/*
  this file will hold details of the transactions that we want to enter
*/

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
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
          ? LayoutBuilder(builder: (context, constraints) {
              return Column(
                children: <Widget>[
                  const Text(
                    'No Transaction Present!',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      color: Color.fromARGB(255, 99, 32, 150),
                      // this is done as per to make the app that whatever kind of input is there in the terminal accept it and gave it the font that is given to the rest in the main dart
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                    // the size box is the same as that of the container but the main difference between the box and the container that the container need a child as well the box can manage to not to have it
                  ),
                  Container(
                    height: constraints.maxHeight *
                        0.5, // as per this is done to give the adjustable height to the image
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.cover,
                      // the box fit is the code that will make the code or the image to fit in the spae that is being given to it
                    ),
                  ),
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('₹${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width >
                            430 // as per we have made the argument to show the button only when it is in the greater width as per in the landscape mode only
                        ? Card(
                            // as per there was no need of the card but we have used it just tyo give the elevation as per elevation can be only given in the card as per without elevation it was looking odd
                            elevation: 4,
                            child: TextButton.icon(
                              // we have use the textButton as per there was so much of the space being empty in the landscape mode as per to use that space we made this button as per it will only show itself in the landscape mode
                              icon: const Icon(Icons.delete),
                              label: Text(
                                'Delete',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .error, // new syntax for error color
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onPressed: () => deleteTr(
                                transactions[index].id,
                              ),
                            ),
                          )
                        : IconButton(
                            // as per making this icon in the (:) make it visible only when in the portrait as per in the portrait mode the icon will be present outside the card

                            //trailing is the same as that of the type of the icons as per it is use to show the icon at the side of the every transaction that the user want to delete
                            onPressed: () => deleteTr(
                              transactions[index].id,
                            ), // the command created to take place to delete the transaction
                            icon: const Icon(
                              Icons.delete,
                            ),
                            color: Theme.of(context).colorScheme.error,
                          ),
                  ),
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
