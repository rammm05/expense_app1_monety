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
        padding: const EdgeInsets.all(20),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 150,),
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
            SizedBox(height: 30,),
            OutlinedButton(onPressed: (){}, child: Text("Login", style: TextStyle(fontSize: 25),),),
            SizedBox(height: 150,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Didn't have any accout?", style: TextStyle(fontSize: 20),),
                SizedBox(width: 10,),
                InkWell(
                  onTap: (){

                  },
                    child: Text("Sign up", style: TextStyle(fontSize: 20, color: Colors.deepPurpleAccent),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}