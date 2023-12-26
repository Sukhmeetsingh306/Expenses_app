// ignore_for_file: file_names

/*in this we are making the code to handle the new items that are going to be added in the app as per thought the textfield

we used the stateful widget as per we have to make the changes in the app in it*/

import 'dart:io';

import 'package:expenses_app/adaptive/adaptive_add_transaction.dart';

import '../adaptive/adaptive_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  // we had coverted it to the stateFull st from the stateless as per to solve th error of the losing of the data from the field when it was getting entered as per making the app to erase it data self as per the stateFull accept the modification in the app but stateless doesn't

  final Function addTx; // as per in this we will enter the elements
  const NewTransaction(this.addTx,
      {super.key, required HitTestBehavior behavior});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // for importing the private class of the usertransaction to this class

  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  // this is for making the entry private that the entry can be done but can't be edited ones it is there

  DateTime date = DateTime(2016, 10, 26);
  DateTime? _selectDate;
  // as per it was giving us the error of the not defining the null date time as per we have to do it to make the constraint to look like null or not null

  void _addData() {
    // as per we have created this to make the flutter as key t0 add the all the data in the system in success as per making the flutter to work as accepting it as per make this as the on submitted on every textfield

    // this is being done as per due to the entry of the data that will be public while entering as will become private when it will be entered
    final amountController = _amountController;
    // as per doing this made us to solve the double error in the app as per it was due to the amount reason that was caused due to the amount being not be getting initialized

    final enterTitle = _titleController
        .text; //as per for making the title to appear in the chart as per by making the title from the private class
    final enterAmount = double.parse(amountController.text);
    // as we were unable to put thr amount private class straight in the private class but we would be unable to make the private class double as per so that we made the class public
    // this double is taken here as the double was used to initialize the amount in the user trans.

    if (_amountController.text.isEmpty) {
      return;
    } // as per this is for solving the error of the amount

    if (enterTitle.isEmpty || enterAmount <= 0.0 || _selectDate == null) {
      //print("Please Select");
      return;
    } // as per the error of the is empty can be solved by only by adding the (.text) with the enterTitle as per the title can only be empty if and only the title would have text in it

    widget.addTx(
      //as per it give the power of the some class to get the access of the other class as per the name widget is necessary as all the app is made on the widgets
      enterTitle,
      enterAmount,
      _selectDate,
    );

    Navigator.of(context)
        .pop(); //as per this use to make the use of the enter key and to make the typing space get close when the add transaction or the enter key is pressed
  }

  void _showDatePick() {
    Platform.isIOS
        ? showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.all(2),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // CupertinoButton(
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    //   child: const Text("Done"),
                    // ),
                    Expanded(
                        child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      mode: CupertinoDatePickerMode.date,
                      minimumDate: DateTime(2000),
                      maximumDate: DateTime.now().add(
                        const Duration(
                          days: 2 * 365,
                        ),
                      ),
                      onDateTimeChanged: (DateTime pickDate) {
                        setState(() {
                          _selectDate = pickDate;
                          pickDate = date;
                        });
                      },
                    )),
                  ],
                ),
              );
            },
          )
        : showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023, 4, 1),
            lastDate: DateTime.now(),
          ).then(
            (pickDate) {
              if (pickDate == null) {
                return;
              } else {
                setState(
                  () {
                    _selectDate = pickDate;
                  },
                );
              }
            },
          );
    // as per then is used here as per to make the app to select the date and to show us but this docent mean that the app will stop working the app will work until the date is received and after getting it it will continue from  there
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            //  as per this will give us the extra space bellow the card in the landscape mode to see the text widget as per main us able to do the work in the simple manner and make us to see the widget in proper manner
          ),
          child: Column(
            children: <Widget>[
              TextField(
                // this textfield is for the entering of the title in the app
                decoration: const InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                controller: _titleController,
                onSubmitted: (_) => _addData(),
              ),
              TextField(
                decoration: const InputDecoration(
                    labelText: 'Amount',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    )),
                //as per only getting the numeric input
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter
                      .digitsOnly, //as per this will accept the digit only
                ],
                // keyboardType: TextInputType.number,
                onSubmitted: (_) => _addData(),
                // as per this value id given here that the flutter actually don't care about what ever is given in it
                // onChanged: (val) => amountInput = val ,
                controller: _amountController,
                // as it would get the input inside it from the outside or we can say from the device directly
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectDate == null
                              ? 'No Date Chosen'
                              : 'DateChosen : ${DateFormat.yMd().format(_selectDate ?? DateTime.now())}'
                          // as per we have to make the selectDate with the date_time.now as to make the constraint to make the date time appear in the app as per making the app as per when selected it will make it appear other than making it null
                          ),
                    ),
                    AdaptiveButtons("Choose Date", () => _showDatePick())
                  ],
                ),
              ),
              AdaptiveAddTransaction('Add Transaction', () => _addData())
            ],
          ),
        ),
      ),
    );
  }
}