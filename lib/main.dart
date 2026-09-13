import 'package:expense_app1/app_routes.dart';
import 'package:expense_app1/cubit/expense_cubit.dart';
import 'package:expense_app1/db_helper.dart';
import 'package:expense_app1/ui/dashboard/provider/bottom_nav_provider.dart';
import 'package:expense_app1/ui/user_on_board/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context)=> ExpenseCubit(dbHelper: DbHelper.getInstance())), 
        ChangeNotifierProvider(
            create: (context)=> BottomNavProvider()),
        BlocProvider(create: (context)=> UserCubit(dbHelper: DbHelper.getInstance()) )
  ],
      
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: ProfilePage(),
      routes: AppRoutes.mRoots,
      initialRoute: AppRoutes.route_splash,
      debugShowCheckedModeBanner: false,
    );
  }
}
