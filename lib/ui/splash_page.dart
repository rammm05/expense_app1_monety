import 'dart:async';

import 'package:expense_app1/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 4), (){
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