import 'package:expense_app1/models/expense_model.dart';

class FilterExpenseModel {
  String title;
  num balance;
  List<ExpenseModel> expenseList;

  FilterExpenseModel({
    required this.title,
    required this.balance,
    required this.expenseList,
});


}