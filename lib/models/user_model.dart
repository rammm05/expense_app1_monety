import 'package:expense_app1/db_helper.dart';

class UserModel {
  String name,email, pass, createdAt;
  int mobileNo;
  num balance;
  int? id;

  UserModel({
    required this.name,
    required this.email,
    required this.mobileNo,
    required this.pass,
    required this.balance,
    required this.createdAt,
    this.id
  });

  //fromMapTOModel
  factory UserModel.fromMap(Map<String, dynamic>map){
    return UserModel(
        name: map[DbHelper.COLUMN_USER_NAME],
        email: map[DbHelper.COLUMN_USER_EMAIL],
        mobileNo: map[DbHelper.COLUMN_USER_MOBILE_NO],
        pass: map[DbHelper.COLUMN_USER_PASSWORD],
        createdAt: map[DbHelper.COLUMN_USER_CREATED_AT],
        balance: map[DbHelper.COLUMN_USER_BALANCE],
        id: map[DbHelper.COLUMN_USER_ID]
    );
  }

  //fromModelToMap
  Map<String, dynamic> toMap(){
    return {
      DbHelper.COLUMN_USER_NAME : name,
      DbHelper.COLUMN_USER_EMAIL : email,
      DbHelper.COLUMN_USER_MOBILE_NO : mobileNo,
      DbHelper.COLUMN_USER_PASSWORD : pass,
      DbHelper.COLUMN_USER_CREATED_AT : createdAt,
      DbHelper.COLUMN_USER_BALANCE : balance,


    };
  }

}