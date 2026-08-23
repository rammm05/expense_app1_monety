import 'dart:io';

import 'package:expense_app1/expense_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  //private constructor
  DbHelper._();

  static DbHelper getInstance() => DbHelper._();

  Database? mDB;

  static const String EXPENSE_DB = "expenseAppDB.db";
  static const String EXPENSE_TABLE = "expenseApp_table";

  static const String EXPENSE_ID = "expense_id";
  static const String EXPENSE_TYPE = "expense_type";
  static const String EXPENSE_DESC = "expense_desc";
  static const String EXPENSE_MONEY_SPENT = "expense_money_spent";
  static const String EXPENSE_DATE = "expense_date";
  static const String EXPENSE_DEBIT = "expense_debit";

  static const String USER_TABLE = "user_table";
  static const String USER_INDEX = "user_index";
  static const String USER_ID = "user_id";
  static const String USER_PASSWORD = "user_password";


  Future<Database> initDB() async {
    return mDB ??= await openDB();

  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String path = join(appDir.path, EXPENSE_DB);

    return openDatabase(path, version: 1, onCreate: (db , path){
      //creating db
      db.execute(" create table $EXPENSE_TABLE ( $EXPENSE_ID integer primary key autoincrement, $EXPENSE_TYPE text not null, $EXPENSE_DESC text not null, $EXPENSE_MONEY_SPENT integer not null, $EXPENSE_DATE text not null, $EXPENSE_DEBIT integer not null ) ");
      db.execute(" create table $USER_TABLE ( $USER_INDEX integer primary key autoincrement, $USER_ID text primary key, $USER_PASSWORD text not null) ");
    });
  }

  /*Future<bool> insertIDP() async {
    Database db = await initDB();
    int rowsEffected = await db.insert(USER_TABLE, values);
    return rowsEffected>0;
  }*/

  Future <bool> insertData({required ExpenseModel expense}) async {
    Database db = await initDB();
    int rowsEffected = await db.insert(EXPENSE_TABLE, expense.toMap());
    return rowsEffected>0;
  }

  Future<List<ExpenseModel>> fetchData() async {
    Database db = await initDB();
    List<Map<String, dynamic>> data = await db.query(EXPENSE_TABLE);

    List<ExpenseModel> mExpense = [];

    for (Map<String, dynamic> eachData in data){
      mExpense.add(ExpenseModel.fromMap(eachData));
    }
    return mExpense;
  }

}