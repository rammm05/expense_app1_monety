import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../app_routes.dart';

class PreviewPageThird extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            getTitle(),
            SizedBox(height: 30,),
            Stack(
              children: [
                getCard(),
                Positioned(
                  left: 30,
                  bottom: 30,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle , size: 15, color: Colors.grey.shade300,),
                      Icon(Icons.circle , size: 15, color: Colors.grey.shade300,),
                      Icon(Icons.circle , size: 15, color: Colors.amber.shade300,),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: nextBtn(context)
    ));
  }

  ///...title part 1
  Widget getTitle(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          maxRadius: 20,
          backgroundImage: AssetImage("assets/images/logo_monety.png"),
        ),
        SizedBox(width: 5,),
        Text("Monety", style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500
        ),),
      ],
    );


  }

  ///...card part 2
  Widget getCard(){
    return Container(
      width: double.infinity,
      height: 650,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.grey.shade200,
              Colors.white
            ]),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(),
        image: DecorationImage(image: NetworkImage("https://cdn.europosters.eu/image/1300/8939.jpg"),fit: BoxFit.fill)
      ),
    );

  }

  ///...nextBtn part 3
  Widget nextBtn(context){
    return Align(
      alignment: Alignment(1, 0.9),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
        ),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(onPressed: (){
            Navigator.pushReplacementNamed(context, AppRoutes.route_login);
          },
            backgroundColor: Colors.pink.shade200,
            child: Icon(CupertinoIcons.arrow_right, color: Colors.white, size: 25,),
          ),
        ),
      ),
    );

  }
}