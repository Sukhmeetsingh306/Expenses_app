/* as per we will use the late identifier before every field while making it in the project as per
the late is for removing the error from the code as the late will be removed when they are used */


class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction(
      {
      required this.id,
      required this.title,
      required this.amount,
      required this.date});
}


// models transaction.dart