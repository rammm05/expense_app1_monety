import 'package:expense_app1/models/expense_model.dart';
import 'package:expense_app1/models/filter_expense_model.dart';

abstract class ExpenseState {}

class ExpenseInitialState extends ExpenseState{}
class ExpenseLoadingState extends ExpenseState{}
class ExpenseLoadedState extends ExpenseState{
  //List<ExpenseModel> expenseList;
  List<FilterExpenseModel> expenseList;
  ExpenseLoadedState({required this.expenseList});
}
class ExpenseErrorState extends ExpenseState{
  String errMsg;
  ExpenseErrorState({required this.errMsg});
}