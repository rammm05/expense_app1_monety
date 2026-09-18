import 'package:expense_app1/app_constants.dart';
import 'package:expense_app1/cubit/expense_state.dart';
import 'package:expense_app1/db_helper.dart';
import 'package:expense_app1/models/expense_model.dart';
import 'package:expense_app1/models/filter_expense_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenseCubit extends Cubit<ExpenseState>{
  DbHelper dbHelper;

  ExpenseCubit({required this.dbHelper}) : super(ExpenseInitialState());

  void addExpense({required ExpenseModel expense}) async {

    emit(ExpenseLoadingState());

    bool isAdded = await dbHelper.addExpense(expense: expense);
    if(isAdded){
      fetchAllExpense();
    } else {
      emit(ExpenseErrorState(errMsg: "Something went wrong"));
    }
  }

  void fetchAllExpense({int filterType = 0})async{
    emit(ExpenseLoadingState());
    List<ExpenseModel> expenseData = await dbHelper.fetchExpenses();
    filterDataByType(allExp: expenseData, type: filterType);
    //emit(ExpenseLoadedState(expenseList: expenseData));
  }




  void deleteExpense(){}

  void editExpense(){}


  /// 0-> date wise 1-> month wise 2-> year wise 3-> cat wise
  void filterDataByType({required List<ExpenseModel> allExp, required int type}){
    if(type < 3 ){
      //date wise filter
      DateFormat df = DateFormat.yMMMEd();

      if(type == 1){
        df = DateFormat.yMMM();
      } else if (type == 2){
        df = DateFormat.y();
      }

      //unique dates
      List<String> uniqueDates = [];

      for(ExpenseModel eachExp in allExp){
        String date = df.format(
            DateTime.fromMillisecondsSinceEpoch(
                int.parse(eachExp.createdAt)
            )
        );
        if(!uniqueDates.contains(date)){
          uniqueDates.add(date);
        }

      }
      print(uniqueDates);

      List<FilterExpenseModel> mFilterExpenseList = [];

      ///calculate unique dates expenses
      for (String eachDate in uniqueDates){
        num bal = 0;
        List<ExpenseModel> eachDateExp = [];

        for(ExpenseModel eachExp in allExp){
          String date = df.format(
              DateTime.fromMillisecondsSinceEpoch(
                  int.parse(eachExp.createdAt)
              )
          );
          if(eachDate == date){
            if(eachExp.type ==0){
              bal -= eachExp.amt;
            } else {
              bal += eachExp.amt;
            }
            eachDateExp.add(eachExp);
          }

        }

        mFilterExpenseList.add(FilterExpenseModel(
            title: eachDate,
            balance: bal,
            expenseList: eachDateExp
        ));



      }

      emit(ExpenseLoadedState(expenseList: mFilterExpenseList));

    }

    else if(type == 3){
      //cat wise filter
      //unique categories

      List<int> uniqueCat = List.generate(AppConstants.expenseCat.length, (index){
        return index;
      });

      print(uniqueCat);


      List<FilterExpenseModel> mFilterExpenseList = [];

      ///calculate unique dates expenses
      for (int eachCat in uniqueCat){
        num bal = 0;
        List<ExpenseModel> eachCatExp = [];

        for(ExpenseModel eachExp in allExp){
          if(eachCat == eachExp.category){
            if(eachExp.type ==0){
              bal -= eachExp.amt;
            } else {
              bal += eachExp.amt;
            }
            eachCatExp.add(eachExp);
          }

        }

        if(eachCatExp.isNotEmpty){
          mFilterExpenseList.add(FilterExpenseModel(
              title: AppConstants.expenseCat[eachCat]["type"],
              balance: bal,
              expenseList: eachCatExp
          ));
        }



      }

      emit(ExpenseLoadedState(expenseList: mFilterExpenseList));
    }
  }



}