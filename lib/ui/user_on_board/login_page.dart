import 'package:expense_app1/app_routes.dart';
import 'package:expense_app1/ui/user_on_board/cubit/user_cubit.dart';
import 'package:expense_app1/ui/user_on_board/cubit/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget{

  TextEditingController emailOrPhoneNoControlller = TextEditingController();
  TextEditingController passwordControlller = TextEditingController();

  final emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool isLoading = false;


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
                  if(value == null || value.isEmpty){
                    return "please enter email or phone number";

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
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "please enter password";

                  } else {
                    return null;
                  }

                },
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
              BlocConsumer<UserCubit, UserState>(
                listener: (context, state){
                  if(state is UserLoadingState){
                    isLoading = true;
                  } else if (state is UserLoadedState){
                    isLoading = false;
                    Navigator.pushReplacementNamed(context, AppRoutes.route_bottom_nav_main);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Welcome to Monety"),backgroundColor: Colors.green,));

                  } else if(state is UserFailureState){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.failureMsg),backgroundColor: Colors.red,));

                  }
                },
                builder: (context, state) {
                  return SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: OutlinedButton(onPressed: (){
                      if(formkey.currentState!.validate()){
                        context.read<UserCubit>().loginUser(
                            email: emailOrPhoneNoControlller.text,
                            pass: passwordControlller.text);
                      }

                    },
                      child: Text("Login", style: TextStyle(fontSize: 25),),),
                  );
                }
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