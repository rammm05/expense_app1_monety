import 'package:expense_app1/cubit/expense_state.dart';
import 'package:expense_app1/db_helper.dart';
import 'package:expense_app1/expense_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseCubit extends Cubit<ExpenseState>{
  DbHelper dbHelper;

  ExpenseCubit({required this.dbHelper}) : super(ExpenseState(expenseList: []));

  addExpense({required ExpenseModel expense}) async {
    bool isAdded = await dbHelper.insertData(expense: expense);
    if(isAdded){
      fetchAllExpense();
    }
  }

  fetchAllExpense()async{
    List<ExpenseModel> expenseData = await dbHelper.fetchData();
    emit(ExpenseState(expenseList: expenseData));
  }




  deleteExpense(){}

  editExpense(){}



}