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
import 'package:flutter/cupertino.dart';

class AppRoutes {

  static const String route_splash = "/";
  static const String route_login = "/login";
  static const String route_signup = "/signup";

  static const String route_preview = "/preview";
  static const String route_preview_second = "/preview_second";
  static const String route_preview_third = "/preview_third";

  static const String route_home = "/home";
  static const String route_second_page = "/second_page";
  static const String route_profile_page = "/profile_page";
  static const String route_notification_page = "/notification_page";
  static const String route_insert_expense = "/insert_expense";

  static Map<String, WidgetBuilder> mRoots = {
    route_splash : (context) => SplashPage(),
    route_login : (context) => LoginPage(),
    route_signup: (context) => SignupPage(),
    route_preview : (context) => PreviewPage(),
    route_preview_second : (context) => PreviewPageSecond(),
    route_preview_third : (context) => PreviewPageThird(),
    route_home : (context) => HomePage(),
    route_second_page : (context) => SecondPage(),
    route_profile_page : (context) => ProfilePage(),
    route_notification_page : (context) => NotificationPage(),
    route_insert_expense : (context) => InsertExpensePage(),

  };
}