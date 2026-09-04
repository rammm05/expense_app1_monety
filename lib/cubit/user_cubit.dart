import 'package:expense_app1/cubit/user_state.dart';
import 'package:expense_app1/db_helper.dart';
import 'package:expense_app1/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState>{
  DbHelper dbHelper;

  UserCubit({required this.dbHelper}) : super(UserState(mUsers: []));

  addUser({required UserModel user}) async {
    bool isAdded =  await dbHelper.insertUser(newUser: user);
    if(isAdded){
      fetchUser();
    }
  }

  fetchUser() async {
    List<UserModel> mUsers = await dbHelper.fetchUser();
    emit(UserState(mUsers: mUsers));
  }
}