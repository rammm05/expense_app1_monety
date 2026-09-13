abstract class UserState {}

class UserInitialState extends UserState{}
class UserLoadingState extends UserState{}
class UserLoadedState extends UserState{}

class UserFailureState extends UserState{
  String failureMsg;
  UserFailureState({required this.failureMsg});
}