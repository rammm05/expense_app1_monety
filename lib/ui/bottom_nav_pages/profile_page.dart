import 'package:expense_app1/app_routes.dart';
import 'package:expense_app1/cubit/user_cubit.dart';
import 'package:expense_app1/cubit/user_state.dart';
import 'package:expense_app1/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile page", style: TextStyle(fontSize: 30)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 45),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state){

                  List<UserModel> mUsers = state.mUsers;

                  return ListView.builder(
                      itemCount: mUsers.length,
                      itemBuilder: (context, index){
                        return Container(
                          margin: EdgeInsets.only(bottom: 30),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepPurple.shade200
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(CupertinoIcons.profile_circled, size: 50),
                              SizedBox(width: 10),
                              Text("user1", style: TextStyle(fontSize: 25)),
                              Spacer(),
                              IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.delete)),
                            ],
                          ),
                        );
                      });
                },
              ),
            ),
            SizedBox(
              height: 70,
                width: double.infinity,
                child: OutlinedButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, AppRoutes.route_login);
                }, child: Text("Log Out", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),))),
          ],
        ),
      ),
    );
  }
}
