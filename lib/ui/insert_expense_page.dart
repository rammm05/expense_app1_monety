import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InsertExpensePage extends StatelessWidget{

  TextEditingController typeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 130,),
              TextField(
                decoration: InputDecoration(
                  label: Text("Type"),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.deepPurple.shade100
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  label: Text("description"),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.deepPurple.shade100,
                  alignLabelWithHint: true
                ),
                maxLines: 4,
                minLines: 2,
              ),
              SizedBox(height: 30,),
              TextField(
                decoration: InputDecoration(
                  label: Text("Date"),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.deepPurple.shade100
                ),
              ),
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Cancel", style: TextStyle(fontSize: 35),)),
                  SizedBox(width: 30,),
                  OutlinedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("Save", style: TextStyle(fontSize: 35),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}