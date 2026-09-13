import 'package:expense_app1/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{

  TextEditingController emailOrPhoneNoControlller = TextEditingController();
  TextEditingController passwordControlller = TextEditingController();

  final emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  GlobalKey<FormState> formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundImage: AssetImage("assets/images/logo_monety.png"),),
            SizedBox(width: 5,),
            Text("Monety", style: TextStyle(fontSize: 30),),
            SizedBox(width: 20,)
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hi, welcome to Monety", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              SizedBox(height: 11,),
              TextFormField(
                validator: (value){
                  if(value!.length != 10 || emailRegExp.hasMatch(value)){
                    return "enter valid email or phone number";

                  } else {
                    return null;
                  }

                },
                 controller: emailOrPhoneNoControlller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  ),
                  hintText: "Enter your email or phone no",
                  labelText: "Email or phone number",
                    fillColor: Colors.deepPurple.shade100,
                  filled: true
                ),
              ),
              SizedBox(height: 11,),
              TextFormField(
                controller: passwordControlller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                    ),
                    hintText: "Enter password here..",
                    labelText: "Password",
                    fillColor: Colors.deepPurple.shade100,
                    filled: true
                ),
              ),
              SizedBox(height: 22,),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: OutlinedButton(onPressed: (){
                  if(formkey.currentState!.validate()){
                    Navigator.pushReplacementNamed(context, AppRoutes.route_bottom_nav_main);
                  }

                },
                  child: Text("Login", style: TextStyle(fontSize: 25),),),
              ),
              SizedBox(height: 150,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Didn't have any accout?", style: TextStyle(fontSize: 20),),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, AppRoutes.route_signup);
                    },
                      child: Text("Sign up", style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent, fontWeight: FontWeight.bold),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}