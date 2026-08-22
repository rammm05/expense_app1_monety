import 'package:expense_app1/app_routes.dart';
import 'package:expense_app1/ui/home_page.dart';
import 'package:expense_app1/ui/insert_expense_page.dart';
import 'package:expense_app1/ui/login_page.dart';
import 'package:expense_app1/ui/notification_page.dart';
import 'package:expense_app1/ui/preview_page.dart';
import 'package:expense_app1/ui/preview_page_second.dart';
import 'package:expense_app1/ui/preview_page_third.dart';
import 'package:expense_app1/ui/profile_page.dart';
import 'package:expense_app1/ui/second_page.dart';
import 'package:expense_app1/ui/signup_page.dart';
import 'package:expense_app1/ui/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: InsertExpensePage(),
      routes: AppRoutes.mRoots,
      initialRoute: AppRoutes.route_splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
