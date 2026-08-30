import 'package:expense_app1/cubit/expense_cubit.dart';
import 'package:expense_app1/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class InsertExpensePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InsertExpensePageState();
}


class InsertExpensePageState extends State<InsertExpensePage>{

  TextEditingController typeController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController moneySpentController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateFormat df = DateFormat.yMMMd();

  void clearAll(){
    typeController.clear();
    descController.text = "";
    moneySpentController.clear();
    selectedDate = DateTime.now();
    setState(() {});
  }

  List<String> moneyStatus = ["Credited", "Debited"];
  int selectedMoneyStatus = 1;

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
              ///...type
              insertType(),
              SizedBox(height: 30,),
              ///...desc
              insertDesc(),
              SizedBox(height: 30,),
              ///...money spent
              insertMoneySpent(),
              SizedBox(height: 30,),
              ///...date
              insertDate(),
              SizedBox(height: 30,),
              ///...status
              insertCreditStatus(),
              SizedBox(height: 50,),
              ///...clear and save
              clearAndSave()

            ],
          ),
        ),
      ),
    );
  }

  ///...type
  Widget insertType(){
    return TextField(
      controller: typeController,
      decoration: InputDecoration(
          label: Text("Type", style: TextStyle(fontWeight: FontWeight.bold),),
          hint: Text("Ex. Shop"),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.deepPurple.shade100
      ),
    );
  }

  ///...desc
  Widget insertDesc(){
    return TextField(
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
    );
  }

  ///...money spent
  Widget insertMoneySpent(){
    return TextField(
      controller: moneySpentController,
      decoration: InputDecoration(
          label: Text("Money Spent", style: TextStyle(fontWeight: FontWeight.bold),),
          hint: Text("Ex. 1290"),
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.deepPurple.shade100
      ),
    );
  }

  ///...date
  Widget insertDate(){
    return Row(
      children: [
        Text("Date :", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        SizedBox(width: 10,),
        Expanded(
          child: ElevatedButton(
              onPressed: () async {
                var date = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now().subtract(Duration(days: 731)),
                    lastDate: DateTime.now(),
                    currentDate: selectedDate
                );
                if(date != null){
                  selectedDate = date;
                  setState(() {

                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade100,
              ),
              child: Text(df.format(selectedDate),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black, fontSize: 18),
              )
          ),
        ),
      ],
    );
  }

  ///...status
  Widget insertCreditStatus(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Status :", style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20
        ),),
        Row(
            children: List.generate(moneyStatus.length, (index){
              return RadioMenuButton(value: index,
                  groupValue: selectedMoneyStatus,
                  onChanged: (value){
                    selectedMoneyStatus = value!;
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

    );
  }

  ///...clear and save
  Widget clearAndSave(){
    return Row(
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
              date: selectedDate.millisecondsSinceEpoch.toString(),
              moneyDebit: selectedMoneyStatus
          ));
          clearAll();
        }, child: Text("Save", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),)),
      ],
    );
  }




}