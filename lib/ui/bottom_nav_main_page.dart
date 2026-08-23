import 'package:expense_app1/ui/bottom_nav_pages/home_page.dart';
import 'package:expense_app1/ui/bottom_nav_pages/insert_expense_page.dart';
import 'package:expense_app1/ui/bottom_nav_pages/notification_page.dart';
import 'package:expense_app1/ui/bottom_nav_pages/profile_page.dart';
import 'package:expense_app1/ui/bottom_nav_pages/second_page.dart';
import 'package:flutter/material.dart';

class BottomNavMainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => BottomNavMainPageState();
}


class BottomNavMainPageState extends State<BottomNavMainPage>{

  int selectedIndex = 0;

  List<Widget> navPages = [
    HomePage(),
    SecondPage(),
    InsertExpensePage(),
    NotificationPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navPages[selectedIndex],
      bottomNavigationBar: NavigationBar(

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
        selectedIndex: selectedIndex,
        onDestinationSelected: (value){
            selectedIndex = value;
            setState(() {

            });
        },
      ),
    );
  }

}