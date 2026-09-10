import 'package:expense_app1/cubit/expense_cubit.dart';
import 'package:expense_app1/cubit/expense_state.dart';
import 'package:expense_app1/models/expense_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  statisticAndThisMonth(),
                  SizedBox(height: 15,),
                  totalExpenseCard(),
                  SizedBox(height: 25,),
                  expenseBreakdownAndWeek(),
                  SizedBox(height: 15,),
                  graphCard(),
                  spendingDetailsTxt(),
                  yourExpenseTxt(),
                  SizedBox(height: 15,),
                  dividerPercentage(),
                  writtenPercentage(),
                  gridPart(),
                  Divider(),
                ],
              ),
            ),
          ),

        ));
  }

  ///...Statistic and this month part ..1
  Widget statisticAndThisMonth() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Statistic", style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold
      ),),
      Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Text("This month"),
              Icon(Icons.expand_more)
            ],
          )
      )
    ],
  );

  ///...total expense card part ..2
  Widget totalExpenseCard() => SizedBox(
    width: double.infinity,
    height: 120,
    child: Card(
      color: Color(0xC75754B1),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total expense", style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),),
                CircleAvatar(
                  maxRadius: 15,
                  backgroundColor: Colors.white30,
                    child: Icon(Icons.more_horiz, color:  Colors.white,))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("\$3,734", style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w500
                ),),
                Text("/ \$4000 per month", style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 8,
                    child: Divider(
                      thickness: 5,
                      color: Colors.amber,
                    )),
                Expanded(
                    flex: 2,
                    child: Divider(
                      thickness: 5,
                      color: Colors.blue.shade800,
                    )),
              ],
            ),

          ],
        ),
      ),
    ),
  );

  ///...expense breakdown and week part ..3
  Widget expenseBreakdownAndWeek() => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Expense Breakdown", style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500
          ),),
          Text("Limit \$900 / week", style: TextStyle(
            fontSize: 20,
          ),),

        ],
      ),
      Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Text("Week", style: TextStyle(
                  fontSize: 20
              ),),
              Icon(Icons.expand_more)
            ],
          )
      )
    ],
  );

  ///...graph card part ..4
  Widget graphCard() => SizedBox(
    width: double.infinity,
    height: 200,
    child: Card(
      color: Colors.grey.shade200,
    ),
  );

  ///...spending details title part ..5
  Widget spendingDetailsTxt() => Text("Spending Details", style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w500
  ),);

  ///...your expenses txt part ..6
  Widget yourExpenseTxt() => Text("Your expenses are divided into 6 categories", style: TextStyle(
    fontSize: 18,
  ),);

  ///...divider % part ..7
  Widget dividerPercentage() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
          flex: 8,
          child: Divider(
            thickness: 5,
            color: Colors.blue,
          )),
      Expanded(
          flex: 5,
          child: Divider(
            thickness: 5,
            color: Colors.pinkAccent,
          )),
      Expanded(
          flex: 3,
          child: Divider(
            thickness: 5,
            color: Colors.amber,
          )),
      Expanded(
          flex: 2,
          child: Divider(
            thickness: 5,
            color: Colors.lightBlueAccent,
          )),
      Expanded(
        //flex: 8,
          child: Divider(
            thickness: 5,
            color: Colors.red,
          )),
      Expanded(
        //flex: 2,
          child: Divider(
            thickness: 5,
            color: Colors.greenAccent,
          )),
    ],
  );

  ///...written % part ..8
  Widget writtenPercentage() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
          flex: 8,
          child: Text("40%")),
      Expanded(
          flex: 5,
          child: Text("25%")),
      Expanded(
          flex: 3,
          child: Text("15%")),
      Expanded(
          flex: 2,
          child: Text("10%")),
      Expanded(
        //flex: 8,
          child: Text("5%")),
      Expanded(
        //flex: 2,
          child: Text("5%")),
    ],
  );

  ///...grid part ..9
  Widget gridPart(){
    return BlocBuilder<ExpenseCubit, ExpenseState>(builder: (context, state){

      List<ExpenseModel> expenseList = state.expenseList;

      return GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250,
              childAspectRatio: 2/1,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20

          ),itemCount: expenseList.length,
          itemBuilder: (context, index){

            ExpenseModel currExpense = expenseList[index];

            return Container(
              decoration: BoxDecoration(
                //color: Colors.red,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10 , vertical: 15),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.green.shade200,
                    ),
                    child: Icon(CupertinoIcons.cart),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(currExpense.type, style:
                        TextStyle(
                            fontSize: 20
                        ),overflow: TextOverflow.ellipsis, maxLines: 1,
                        ),
                        Text("-${currExpense.moneySpent}", style:
                        TextStyle(
                            color: Colors.pinkAccent,
                            fontSize: 20
                        ),),


                      ],
                    ),
                  )
                ],
              ),
            );
          }
      );
    });
  }


}