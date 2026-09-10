import 'package:expense_app1/app_routes.dart';
import 'package:expense_app1/cubit/user_cubit.dart';
import 'package:expense_app1/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatelessWidget{

  TextEditingController userNameControlller = TextEditingController();
  TextEditingController userEmailControlller = TextEditingController();
  TextEditingController userMobileNoControlller = TextEditingController();
  TextEditingController passwordControlller = TextEditingController();
  TextEditingController confirmPassControlller = TextEditingController();
  bool isPassVisible = false;
  bool isConfirmPassVisible = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  final RegExp passwordRegex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
  );

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
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hi, welcome to Monety", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              SizedBox(height: 11,),
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please enter your name";
                  } else {
                    return null;
                  }
                },
                controller: userNameControlller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    hintText: "Enter your name here..",
                    labelText: "Name",
                    fillColor: Colors.deepPurple.shade100,
                    filled: true
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please enter your email";
                  } else if(!emailRegExp.hasMatch(value)){
                    return "Please enter a valid email";
                  } else {
                    return null;
                  }
                },
                controller: userEmailControlller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    hintText: "Enter your email here..",
                    labelText: "Email",
                    fillColor: Colors.deepPurple.shade100,
                    filled: true
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Please enter your mobile no";
                  } else if(value.length != 10){
                    return "Please enter a valid mobile no";
                  }
                  else {
                    return null;
                  }
                },
                controller: userMobileNoControlller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    hintText: "Enter your mobile no..",
                    labelText: "Mobile no",
                    fillColor: Colors.deepPurple.shade100,
                    filled: true
                ),
              ),
              SizedBox(height: 20,),
              StatefulBuilder(
                builder: (context, ss) {
                  return TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please enter your password";
                      } else if(!passwordRegex.hasMatch(value)){
                        return "Password must contain at least 8 characters,\none uppercase, \none lowercase, \none number, \nand one special character";
                      }
                      else {
                        return null;
                      }
                    },
                    obscureText: !isPassVisible,
                    controller: passwordControlller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        hintText: "Create password",
                        labelText: "Password",
                        fillColor: Colors.deepPurple.shade100,
                        filled: true,
                      suffixIcon: InkWell(
                        onTap: (){
                          isPassVisible = !isPassVisible;
                          ss((){});
                        },
                          child: Icon(isPassVisible ? Icons.visibility : Icons.visibility_off)
                      )
                    ),
                  );
                }
              ),
              SizedBox(height: 20,),
              StatefulBuilder(
                builder: (context, ss) {
                  return TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Please re-enter your password";
                      } else if(value != passwordControlller.text){
                        return "Password doesn't match";
                      }
                      else {
                        return null;
                      }
                    },
                    obscureText: !isConfirmPassVisible,
                    controller: confirmPassControlller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)
                        ),
                        hintText: "Re-type your password here..",
                        labelText: "Confirm Password",
                        fillColor: Colors.deepPurple.shade100,
                        filled: true,
                        suffixIcon: InkWell(
                            onTap: (){
                              isConfirmPassVisible = !isConfirmPassVisible;
                              ss((){});
                            },
                            child: Icon(isConfirmPassVisible ? Icons.visibility : Icons.visibility_off)
                        )
                    ),
                  );
                }
              ),
              SizedBox(height: 30,),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: OutlinedButton(
          
                  onPressed: (){
                    /*if(passwordControlller.text == confirmPasswordControlller.text){
                      context.read<UserCubit>().addUser(
                          user: UserModel(
                              pass: passwordControlller.text,
                              userName: useridControlller.text
                          )
                      );
                    } else {
                      print("Pass doesn't match!");
                    }*/
                    if(formKey.currentState!.validate()){
                      Navigator.pushReplacementNamed(context, AppRoutes.route_bottom_nav_main);

                    }
          
                },
          
                  child: Text("Sign up", style: TextStyle(fontSize: 25),),),
              ),
              SizedBox(height: 11,),
              Center(
                child: InkWell(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, AppRoutes.route_login);
                      },
                        child: Text.rich(TextSpan(
                          text: "Already have an account, ",
                          style: TextStyle(fontSize: 16, color: Colors.deepPurple,),
                          children: [
                            TextSpan(
                              text: "login now..",
                              style: TextStyle(fontSize: 16, color: Colors.deepPurple, fontWeight: FontWeight.bold),
          
                            )
                          ]
                        )
                        )),
              ),
          
            ],
          ),
        ),
      ),
    );
  }

}
