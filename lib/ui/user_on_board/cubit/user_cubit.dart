import 'package:expense_app1/db_helper.dart';
import 'package:expense_app1/models/user_model.dart';
import 'package:expense_app1/ui/user_on_board/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState>{

  DbHelper dbHelper;
  UserCubit({required this.dbHelper}) : super(UserInitialState());


  void loginUser({required String email, required String pass}) async {

    emit(UserLoadingState());

    bool check = await dbHelper.authUser(email: email, pass: pass);
    if(check){
      emit(UserLoadedState());
    } else {
      emit(UserFailureState(
          failureMsg: "Invalid credentials")
      );
    }

  }

  void signUpUser({
    required String email,
    required String pass,
    required int mobileNo,
    required String name,
  }) async {

    emit(UserLoadingState());

    int result = await dbHelper.registerUser(newUser: UserModel(
        name: name,
        email: email,
        mobileNo: mobileNo,
        pass: pass,
        balance: 0,
        createdAt: DateTime.now().millisecondsSinceEpoch.toString()
    ));

    if(result ==1){
      emit(UserLoadedState());
    } else if(result ==2){
      emit(UserFailureState(
          failureMsg: "Something went wrong"));
    } else {
      emit(UserFailureState(
          failureMsg: "Email already exists"));
    }
  }

  Future<String> getUser(int uid) async {
    String userName = await dbHelper.getUserName(uid: uid);
    return userName;
  }

}