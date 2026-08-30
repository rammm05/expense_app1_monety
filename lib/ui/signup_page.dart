import 'package:expense_app1/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget{

  TextEditingController useridControlller = TextEditingController();
  TextEditingController passwordControlller = TextEditingController();

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
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 150,),
            TextField(
              controller: useridControlller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                  hintText: "Enter user id",
                  labelText: "User id",
                  fillColor: Colors.deepPurple.shade100,
                  filled: true
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordControlller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                  hintText: "Create password",
                  labelText: "Create password",
                  fillColor: Colors.deepPurple.shade100,
                  filled: true
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordControlller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)
                  ),
                  hintText: "Confirm password",
                  labelText: "Confirm Password",
                  fillColor: Colors.deepPurple.shade100,
                  filled: true
              ),
            ),
            SizedBox(height: 30,),
            OutlinedButton(onPressed: (){
              Navigator.pushReplacementNamed(context, AppRoutes.route_bottom_nav_main);
            }, child: Text("Sign up", style: TextStyle(fontSize: 25),),),
            SizedBox(height: 150,),
            InkWell(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, AppRoutes.route_login);
                  },
                    child: Text("Back to Login", style: TextStyle(fontSize: 20, color: Colors.deepPurple,),)),

          ],
        ),
      ),
    );
  }

}
