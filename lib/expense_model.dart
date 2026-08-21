import 'package:expense_app1/db_helper.dart';
import 'package:flutter/foundation.dart';

class ExpenseModel {
  int? id;
  int moneySpent;
  String title, desc, date;

  ExpenseModel({
    required this.title,
    required this.desc,
    required this.moneySpent,
    required this.date,
    this.id
  });

  //fromMapToModel
factory ExpenseModel.fromMap(Map<String, dynamic> map){
  return ExpenseModel(
      title: map[DbHelper.EXPENSE_TITLE],
      desc: map[DbHelper.EXPENSE_DESC],
      moneySpent: map[DbHelper.EXPENSE_MONEY_SPENT],
      date: map[DbHelper.EXPENSE_DATE],
      id: map[DbHelper.EXPENSE_ID]
  );
}

  //fromModelToMap
Map<String, dynamic> toMap(){
  return {
    DbHelper.EXPENSE_TITLE : title,
    DbHelper.EXPENSE_DESC : desc,
    DbHelper.EXPENSE_MONEY_SPENT : moneySpent,
    DbHelper.EXPENSE_DATE : date,
  };


}

}