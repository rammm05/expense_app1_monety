import 'dart:io';

import 'package:expense_app1/app_constants.dart';
import 'package:expense_app1/models/expense_model.dart';
import 'package:expense_app1/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  //private constructor
  DbHelper._();

  static DbHelper getInstance() => DbHelper._();

  Database? mDB;

  static const String EXPENSE_DB = "expenseDB.db";

  static const String TABLE_EXPENSE = "exp";

  static const String COLUMN_EXPENSE_ID = "e_id";
  static const String COLUMN_EXPENSE_TITLE = "e_title";
  static const String COLUMN_EXPENSE_DESC = "e_desc";
  static const String COLUMN_EXPENSE_AMT = "expense_amt";
  static const String COLUMN_EXPENSE_CREATED_AT = "e_date";
  static const String COLUMN_EXPENSE_CATEGORY = "e_category";
  static const String COLUMN_EXPENSE_TYPE = "e_type";  //credit, debit


  static const String TABLE_USER = "user";

  static const String COLUMN_USER_ID = "u_id";
  static const String COLUMN_USER_NAME = "u_name";
  static const String COLUMN_USER_EMAIL = "u_email";
  static const String COLUMN_USER_MOBILE_NO = "u_mobile_no";
  static const String COLUMN_USER_PASSWORD = "u_password";
  static const String COLUMN_USER_BALANCE = "u_balance";
  static const String COLUMN_USER_CREATED_AT = "u_created_at";


  Future<Database> initDB() async {
    return mDB ??= await openDB();

  }

  Future<Database> openDB() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    String path = join(appDir.path, EXPENSE_DB);

    return openDatabase(path, version: 1, onCreate: (db , path){
      //creating db
      db.execute(" create table $TABLE_EXPENSE ( $COLUMN_EXPENSE_ID integer primary key autoincrement, $COLUMN_EXPENSE_TITLE text not null, $COLUMN_EXPENSE_DESC text not null, $COLUMN_EXPENSE_AMT real not null, $COLUMN_EXPENSE_CREATED_AT text not null, $COLUMN_EXPENSE_CATEGORY integer not null, $COLUMN_EXPENSE_TYPE integer not null, $COLUMN_USER_ID integer not null ) ");
      db.execute(" create table $TABLE_USER ( $COLUMN_USER_ID integer primary key autoincrement, $COLUMN_USER_NAME text not null, $COLUMN_USER_EMAIL text not null, $COLUMN_USER_MOBILE_NO integer not null, $COLUMN_USER_PASSWORD text not null, $COLUMN_USER_CREATED_AT text not null, $COLUMN_USER_BALANCE real not null) ");
    });
  }


  Future <bool> addExpense({required ExpenseModel expense}) async {
    Database db = await initDB();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uId = prefs.getInt(AppConstants.PREF_USER_ID) ?? 0;
    expense.userId = uId;

    int rowsEffected = await db.insert(TABLE_EXPENSE, expense.toMap());
    return rowsEffected>0;
  }

  Future<List<ExpenseModel>> fetchExpenses() async {
    Database db = await initDB();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    int uId = prefs.getInt(AppConstants.PREF_USER_ID) ?? 0;

    List<Map<String, dynamic>> data = await db.query(
        TABLE_EXPENSE,
        where: "$COLUMN_USER_ID = ?",
      whereArgs: ["$uId"]
    );

    List<ExpenseModel> mExpense = [];

    for (Map<String, dynamic> eachData in data){
      mExpense.add(ExpenseModel.fromMap(eachData));
    }
    return mExpense;
  }




/// 1-> insert
/// 2-> failure
/// 3-> email already exists
  Future<int> registerUser({required UserModel newUser}) async {
    Database db = await initDB();
    bool ifUserExists = await checkIfEmailExists(email: newUser.email);

    if (!ifUserExists) {
      int rowsEffected = await db.insert(TABLE_USER, newUser.toMap());
      if (rowsEffected > 0) {

        List<Map<String, dynamic>> userData = await db.query(TABLE_USER,
          where: "$COLUMN_USER_EMAIL = ?",
          whereArgs: [newUser.email]
        );

        int uid =  userData[0][COLUMN_USER_ID];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setInt(AppConstants.PREF_USER_ID, uid);

        return 1;
      } else {
        return 2;
      }
    } else {
      return 3;
    }

  }

  Future<bool> checkIfEmailExists({required String email}) async {
    Database db = await initDB();
    List<Map<String, dynamic>> userData = await db.query(TABLE_USER ,
        where: " $COLUMN_USER_EMAIL = ? ",
        whereArgs: [email]
    );

    return userData.isNotEmpty;

  }

  Future<bool> checkIfMobileNoExists({ required int mobileNo}) async {
    Database db = await initDB();
    List<Map<String, dynamic>> userData = await db.query(
        TABLE_USER ,
        where: "$COLUMN_USER_MOBILE_NO" ,
      whereArgs: [mobileNo]
    );

    return userData.isNotEmpty;
  }

  Future<bool> authUser({required String emailOrMobileNo, required String pass}) async {
    Database db = await initDB();
    List<Map<String, dynamic>> userData = await db.query(TABLE_USER ,
        where: " ($COLUMN_USER_EMAIL = ? or $COLUMN_USER_MOBILE_NO = ?) and $COLUMN_USER_PASSWORD = ? ",
        whereArgs: [emailOrMobileNo, emailOrMobileNo, pass]
    );

    if(userData.isNotEmpty){
      int uid =  userData[0][COLUMN_USER_ID];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setInt(AppConstants.PREF_USER_ID, uid);
    }

    return userData.isNotEmpty;
  }

  Future<String> getUserName({required int uid}) async{
    Database db = await initDB();
    List<Map<String, dynamic>> userData = await db.query(
        TABLE_USER,
        where: "$COLUMN_USER_ID = ?",
        whereArgs: [uid]);

    String name = userData[0][COLUMN_USER_NAME];
    return name;


  }

}