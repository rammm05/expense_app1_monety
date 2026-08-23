import 'package:expense_app1/db_helper.dart';

class UserModel {
  String id,pass;
  int? index;
  UserModel({required this.id, required this.pass, this.index});

  //fromMapTOModel
  factory UserModel.fromMap(Map<String, dynamic>map){
    return UserModel(
    id: map[DbHelper.USER_ID],
    pass: map[DbHelper.USER_PASSWORD],
    index: map[DbHelper.USER_INDEX]
  );
  }

  //fromModelToMap
  Map<String, dynamic> toMap(){
    return {
      DbHelper.USER_ID : id,
      DbHelper.USER_PASSWORD : pass,
      DbHelper.USER_INDEX : index,
    };
  }

}