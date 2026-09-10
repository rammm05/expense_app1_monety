import 'package:expense_app1/ui/bottom_nav_pages/home_page.dart';
import 'package:expense_app1/ui/bottom_nav_pages/insert_expense_page.dart';
import 'package:expense_app1/ui/bottom_nav_pages/notification_page.dart';
import 'package:expense_app1/ui/bottom_nav_pages/profile_page.dart';
import 'package:expense_app1/ui/bottom_nav_pages/second_page.dart';
import 'package:expense_app1/ui/bottom_nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BottomNavMainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => BottomNavMainPageState();
}


class BottomNavMainPageState extends State<BottomNavMainPage>{


  List<Widget> navPages = [
    HomePage(),
    SecondPage(),
    InsertExpensePage(),
    NotificationPage(),
    ProfilePage()
  ];


  @override
  void initState() {
    super.initState();
    context.read<BottomNavProvider>().index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider> (
      builder: (context, provider, child) {
        return Scaffold(
          body: navPages[provider.index],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.grey.shade50,
              selectedItemColor: Colors.pinkAccent.shade200,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(provider.index == 0 ? Icons.home: Icons.home_outlined, size: 28,), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.auto_graph_outlined, size: 28,),
                    label: "Graph"),
                BottomNavigationBarItem(
                    icon: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.pinkAccent.shade200
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 21,),
                    ), label: "Add"),
                BottomNavigationBarItem(
                    icon: Icon( provider.index == 3 ? Icons.notifications : Icons.notifications_outlined, size: 28,),
                    label: "Notifications"),
                BottomNavigationBarItem(
                    icon: Icon( provider.index == 4 ? Icons.account_circle : Icons.account_circle_outlined, size: 28,),
                    label: "Profile"),

              ],
            currentIndex: provider.index,
            onTap: (value){
              context.read<BottomNavProvider>().index = value;
            },

          )

          /*NavigationBar(

              destinations: [
                NavigationDestination(
                    selectedIcon: Icon(Icons.home, size: 30, color: Colors.pinkAccent.shade100),
                    icon: Icon(Icons.home_outlined, size: 30,),
                    label: "Home"),
                NavigationDestination(
                    selectedIcon: Icon(Icons.auto_graph_outlined, size: 30, color: Colors.pinkAccent.shade100),
                    icon: Icon(Icons.auto_graph, size: 30),
                    label: "Graph"),
                NavigationDestination(
                    selectedIcon: Icon(Icons.add_outlined, size: 30, color: Colors.pinkAccent.shade100),
                    icon: Icon(Icons.add, size: 30,
                      //color: Colors.white,
                    ),
                    label: "Add"),
                NavigationDestination(
                    selectedIcon: Icon(Icons.notifications, size: 30, color: Colors.pinkAccent.shade100),
                    icon: Icon(Icons.notifications_outlined, size: 30,),
                    label: "Notifications"),
                NavigationDestination(
                    selectedIcon: Icon(Icons.account_circle, size: 30, color: Colors.pinkAccent.shade100),
                    icon: Icon(Icons.account_circle_outlined, size: 30,),
                    label: "Profile"),
              ],
            indicatorColor: Colors.deepPurple.shade100,
            selectedIndex: provider.index,
            onDestinationSelected: (value){
              context.read<BottomNavProvider> ().index = value;
            },
          )*/
        );
      }
    );
  }

}