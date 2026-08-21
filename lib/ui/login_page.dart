import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
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
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
               //controller: username,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
                ),
                hintText: "Enter username",
                labelText: "Username",
                fillColor: Colors.grey.shade200,
                filled: true
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              //controller: username,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)
                  ),
                  hintText: "Enter password",
                  labelText: "Password",
                  fillColor: Colors.grey.shade200,
                  filled: true
              ),
            ),
          ],
        ),
      ),
    );
  }
}