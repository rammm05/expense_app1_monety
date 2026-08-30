import 'package:expense_app1/db_helper.dart';

class UserModel {
  String userName, pass;
  int? id;
  UserModel({required this.pass, required this.userName, this.id});

  //fromMapTOModel
  factory UserModel.fromMap(Map<String, dynamic>map){
    return UserModel(
    userName: map[DbHelper.USER_NAME],
    pass: map[DbHelper.USER_PASSWORD],
    id: map[DbHelper.USER_ID]
  );
  }

  //fromModelToMap
  Map<String, dynamic> toMap(){
    return {
      DbHelper.USER_ID : id,
      DbHelper.USER_PASSWORD : pass,
      DbHelper.USER_NAME : userName,
    };
  }

}