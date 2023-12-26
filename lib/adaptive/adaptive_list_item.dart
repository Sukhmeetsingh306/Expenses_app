import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

// ignore: camel_case_types
class Adaptive_List_Items extends StatelessWidget {
  const Adaptive_List_Items({
    super.key,
    required this.transaction,
    required this.deleteTr,
  });

  final Transaction transaction;
  final Function deleteTr;

  @override
  Widget build(BuildContext context) {
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
              child: Text('₹${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
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
                    transaction.id,
                  ),
                ),
              )
            : IconButton(
                // as per making this icon in the (:) make it visible only when in the portrait as per in the portrait mode the icon will be present outside the card

                //trailing is the same as that of the type of the icons as per it is use to show the icon at the side of the every transaction that the user want to delete
                onPressed: () => deleteTr(
                  transaction.id,
                ), // the command created to take place to delete the transaction
                icon: const Icon(
                  Icons.delete,
                ),
                color: Theme.of(context).colorScheme.error,
              ),
      ),
    );
  }
}