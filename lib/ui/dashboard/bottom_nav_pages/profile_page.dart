import 'package:expense_app1/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../user_on_board/cubit/user_cubit.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage>{
  int? userId;
  String? userName;

  getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt("userId");
    userName = await context.read<UserCubit>().getUser(userId!);
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    getUserName();
  }

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
            Container(
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
                  Text(userName != null ? userName! : "user1", style: TextStyle(fontSize: 25)),
                  Spacer(),
                  Column(
                    children: [
                      Text("\$150", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.delete)),
                    ],
                  ),
                ],
              ),),

            Spacer(),


            SizedBox(
                height: 70,
                width: double.infinity,
                child: OutlinedButton(onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  prefs.remove("userId");
                  Navigator.pushReplacementNamed(context, AppRoutes.route_login);
                }, child: Text("Log Out", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),))),
          ],
        ),
      ),
    );
  }
}

