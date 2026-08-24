import 'dart:async';

import 'package:expense_app1/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatelessWidget{

  bool isOpened = false;
  //.. splashPage & preview3rdPage

  /*isOpenStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isOpened =  prefs.get("isOpened") ?? false;
    print("status : $isOpened");

  }*/

  @override
  Widget build(BuildContext context) {

    //isOpenStatus();

    Timer(Duration(seconds: 4), (){

      /*if(isOpened){
        Navigator.pushReplacementNamed(context, AppRoutes.route_login);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.route_preview);
      }*/

      Navigator.pushReplacementNamed(context, AppRoutes.route_preview);

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