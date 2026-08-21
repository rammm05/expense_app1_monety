import 'package:expense_app1/ui/home_page.dart';
import 'package:expense_app1/ui/login_page.dart';
import 'package:expense_app1/ui/preview_page.dart';
import 'package:expense_app1/ui/second_page.dart';
import 'package:expense_app1/ui/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
