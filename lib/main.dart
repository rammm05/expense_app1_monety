import 'package:expense_app1/app_routes.dart';
import 'package:expense_app1/cubit/expense_cubit.dart';
import 'package:expense_app1/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context)=> ExpenseCubit(dbHelper: DbHelper.getInstance()),child: MyApp(),)
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: BottomNavMainPage(),
      routes: AppRoutes.mRoots,
      initialRoute: AppRoutes.route_splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
