import 'package:expense_app1/cubit/expense_cubit.dart';
import 'package:expense_app1/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsertExpensePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InsertExpensePageState();
}


class InsertExpensePageState extends State<InsertExpensePage>{

  TextEditingController typeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController moneySpentController = TextEditingController();

  void clearAll(){
    typeController.clear();
    descController.text = "";
    dateController.clear();
    moneySpentController.clear();
    //setState(() {});
  }

  List<String> moneyStatus = ["Credited", "Debited"];
  int seletedMoneyStatus = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Expense",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold)),
          centerTitle: true
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              TextField(
                controller: typeController,
                decoration: InputDecoration(
                    label: Text("Type", style: TextStyle(fontWeight: FontWeight.bold),),
                    hint: Text("Ex. Shop"),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.deepPurple.shade100
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: descController,
                decoration: InputDecoration(
                    label: Text("description", style: TextStyle(fontWeight: FontWeight.bold),),
                    hint: Text("Ex. Buy new clothes"),
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
                controller: dateController,
                decoration: InputDecoration(
                    label: Text("Date", style: TextStyle(fontWeight: FontWeight.bold),),
                    hint: Text("Ex. Tuesday, 14"),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.deepPurple.shade100
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: moneySpentController,
                decoration: InputDecoration(
                    label: Text("Money Spent", style: TextStyle(fontWeight: FontWeight.bold),),
                    hint: Text("Ex. 1290"),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.deepPurple.shade100
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Status :", style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),),
                  Row(
                    children: List.generate(moneyStatus.length, (index){
                      return RadioMenuButton(value: index,
                          groupValue: seletedMoneyStatus,
                          onChanged: (value){
                              seletedMoneyStatus = value!;
                              setState(() {});
                          },
                          child: Text(moneyStatus[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                              fontSize: 20
                            ),));

                    })
                  ),
                ],

              ),

              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(onPressed: (){
                    clearAll();
                  }, child: Text("Clear", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),)),
                  SizedBox(width: 30,),
                  OutlinedButton(onPressed: (){
                    context.read<ExpenseCubit>().addExpense(expense: ExpenseModel(
                        type: typeController.text,
                        desc: descController.text,
                        moneySpent: int.tryParse(moneySpentController.text)  ?? 0,
                        date: dateController.text,
                        moneyDebit: seletedMoneyStatus
                    ));
                    clearAll();
                  }, child: Text("Save", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}