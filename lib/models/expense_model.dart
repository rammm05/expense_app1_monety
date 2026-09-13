import 'package:expense_app1/db_helper.dart';

class ExpenseModel {
  int? eId;
  num  amt;
  int userId, type, category; //1 -> credited , 0-> debited
  String title, desc, createdAt;

  ExpenseModel({
    required this.title,
    required this.desc,
    required this.amt,
    required this.createdAt,
    required this.category,
    required this.type,
    required this.userId,
    this.eId
  });

  //fromMapToModel
factory ExpenseModel.fromMap(Map<String, dynamic> map){
  return ExpenseModel(
      title: map[DbHelper.COLUMN_EXPENSE_TITLE],
      desc: map[DbHelper.COLUMN_EXPENSE_DESC],
      amt: map[DbHelper.COLUMN_EXPENSE_AMT],
      createdAt: map[DbHelper.COLUMN_EXPENSE_CREATED_AT],
      category: map[DbHelper.COLUMN_EXPENSE_CATEGORY],
      type: map[DbHelper.COLUMN_EXPENSE_TYPE],
      userId: map[DbHelper.COLUMN_USER_ID],
      eId: map[DbHelper.COLUMN_EXPENSE_ID]
  );
}

  //fromModelToMap
Map<String, dynamic> toMap(){
  return {
    DbHelper.COLUMN_EXPENSE_TITLE : title,
    DbHelper.COLUMN_EXPENSE_DESC : desc,
    DbHelper.COLUMN_EXPENSE_AMT : amt,
    DbHelper.COLUMN_EXPENSE_CREATED_AT : createdAt,
    DbHelper.COLUMN_EXPENSE_CATEGORY : category,
    DbHelper.COLUMN_EXPENSE_TYPE : type,
    DbHelper.COLUMN_USER_ID : userId,
  };
}

}