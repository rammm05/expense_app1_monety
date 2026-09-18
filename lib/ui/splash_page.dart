import 'dart:async';

import 'package:expense_app1/app_constants.dart';
import 'package:expense_app1/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget{

  //.. splashPage & preview3rdPage
  bool isOpened = false;

  //.. splashPage & dbHelper
  bool isLoggedIn = false;


  @override
  Widget build(BuildContext context) {


    Timer(Duration(seconds: 4), () async {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      isOpened =  prefs.getBool(AppConstants.PREF_IS_OPENED) ?? false;
      print("statusOfOpen : $isOpened");

      int? userId = prefs.getInt(AppConstants.PREF_USER_ID);
      isLoggedIn = userId != null ? true : false;


      if (isOpened) {
        if (isLoggedIn) {
          Navigator.pushReplacementNamed(
              context, AppRoutes.route_bottom_nav_main);
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.route_login);
        }
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.route_preview);
      }



      //Navigator.pushReplacementNamed(context, AppRoutes.route_preview);

    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(backgroundImage: AssetImage("assets/images/logo_monety.png"),maxRadius: 30,),
              SizedBox(width: 10,),
              Text("Monety", style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500
              ),
              ),
              SizedBox(width: 30,),
            ],
          ),
          Text("Manage your Expenses easily", style: TextStyle(
            fontSize: 20
          ),)
        ],
      ),
    );
  }
}