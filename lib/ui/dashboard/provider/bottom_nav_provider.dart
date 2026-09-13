import 'package:flutter/cupertino.dart';

class BottomNavProvider extends ChangeNotifier{
  int _selectedIndex = 0;

  int get index=> _selectedIndex;
  set index(int value){
    _selectedIndex = value;
    notifyListeners();
  }

}