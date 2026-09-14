import 'package:expense_app1/app_constants.dart';
import 'package:expense_app1/cubit/expense_cubit.dart';
import 'package:expense_app1/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertExpensePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => InsertExpensePageState();
}


class InsertExpensePageState extends State<InsertExpensePage>{

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController amtController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  DateFormat df = DateFormat.yMMMd();

  int selectedCatIndex = -1;

  int? userId;

  getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt("userId");
  }

  void clearAll(){
    titleController.clear();
    descController.text = "";
    amtController.clear();
    selectedDate = DateTime.now();
    selectedExpenseType = 0;
    setState(() {});
  }

  List<String> expenseType = ["Debit","Credit"];
  int selectedExpenseType = 0;

  @override
  Widget build(BuildContext context) {
    getUserId();
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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 30,
                child: OutlinedButton(onPressed: (){
                  clearAll();
                }, child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.clear, size: 14,),
                    SizedBox(width: 10,),
                    Text("Clear all",style: TextStyle(fontSize: 15),),
                  ],
                )),
              ),
              SizedBox(height: 11,),
              ///...title
              insertTitle(),
              SizedBox(height: 11,),
              ///...desc
              insertDesc(),
              SizedBox(height: 11,),
              ///...money spent
              insertMoneySpent(),
              SizedBox(height: 11,),
              ///...date
              insertDate(),
              SizedBox(height: 11,),
              getCat(),
              SizedBox(height: 11,),
              ///...status
              insertType(),
              SizedBox(height: 11,),
              ///...clear
              saveBtn()

            ],
          ),
        ),
      ),
    );
  }

  ///...type
  Widget insertTitle(){
    return TextField(
      controller: titleController,
      decoration: InputDecoration(
          label: Text("Title", style: TextStyle(fontWeight: FontWeight.bold),),
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
      controller: amtController,
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
    return SizedBox(
      height: 55,
      width: double.infinity,
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
            side: BorderSide(color: Colors.black, width: 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
          ),
          child: Text(df.format(selectedDate),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )
      ),
    );
  }

  ///...choose category
  Widget getCat(){
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: (){
            showModalBottomSheet(context: context, builder: (context){
              return Container(
                padding: EdgeInsets.all(21),
                width: double.infinity,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
                    itemCount: AppConstants.expenseCat.length,
                    itemBuilder: (context, index){
                      return InkWell(
                        onTap: (){
                          selectedCatIndex = index;
                          setState(() {

                          });
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            Icon(AppConstants.expenseCat[index]["icon"], size: 40,),
                            Text(AppConstants.expenseCat[index]["type"]),
                          ],
                        ),
                      );
                    }),
              );
            });

          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple.shade100,
              side: BorderSide(color: Colors.black, width: 1),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
          ),
          child: selectedCatIndex < 0 ? Text("Choose Category",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(AppConstants.expenseCat[selectedCatIndex]["icon"]),
              Text("- ${AppConstants.expenseCat[selectedCatIndex]["type"]}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black))
            ],
          )
      ),
    );
  }

  ///...insertTypeStatus
  Widget insertType(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(expenseType.length, (index){
          return RadioMenuButton(value: index,
              groupValue: selectedExpenseType,
              onChanged: (value){
                selectedExpenseType = value!;
                setState(() {});
              },
              child: Text(expenseType[index],));

        })
    );
  }

  ///...save
  Widget saveBtn(){
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: OutlinedButton(onPressed: (){
        context.read<ExpenseCubit>().addExpense(
            expense: ExpenseModel(
                title: titleController.text,
                desc: descController.text,
                amt: num.parse(amtController.text),
                createdAt: selectedDate.millisecondsSinceEpoch.toString(),
                category: selectedCatIndex,
                type: selectedExpenseType,
                userId: userId!
            ));
        clearAll();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Expense added"), backgroundColor: Colors.green,));
      }, child: Text("Save",)),
    );
  }








}