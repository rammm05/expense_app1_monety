import 'package:expense_app1/db_helper.dart';

class ExpenseModel {
  int? id;
  int moneySpent , moneyDebit; //0 -> credited , 1-> debited
  String type, desc, date;

  ExpenseModel({
    required this.type,
    required this.desc,
    required this.moneySpent,
    required this.date,
    required this.moneyDebit,
    this.id
  });

  //fromMapToModel
factory ExpenseModel.fromMap(Map<String, dynamic> map){
  return ExpenseModel(
      type: map[DbHelper.EXPENSE_TYPE],
      desc: map[DbHelper.EXPENSE_DESC],
      moneySpent: map[DbHelper.EXPENSE_MONEY_SPENT],
      date: map[DbHelper.EXPENSE_DATE],
      moneyDebit: map[DbHelper.EXPENSE_DEBIT],
      id: map[DbHelper.EXPENSE_ID]
  );
}

  //fromModelToMap
Map<String, dynamic> toMap(){
  return {
    DbHelper.EXPENSE_TYPE : type,
    DbHelper.EXPENSE_DESC : desc,
    DbHelper.EXPENSE_MONEY_SPENT : moneySpent,
    DbHelper.EXPENSE_DATE : date,
    DbHelper.EXPENSE_DEBIT : moneyDebit,
  };
}

}