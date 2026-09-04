import 'package:expense_app1/app_routes.dart';
import 'package:expense_app1/cubit/expense_cubit.dart';
import 'package:expense_app1/cubit/expense_state.dart';
import 'package:expense_app1/models/expense_model.dart';
import 'package:expense_app1/ui/bottom_nav_pages/insert_expense_page.dart';
import 'package:expense_app1/ui/bottom_nav_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  DateFormat df = DateFormat("EEEE dd");

  @override
  void initState() {
    super.initState();
    context.read<ExpenseCubit>().fetchAllExpense();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: Column(
              children: [
                titleAndSearch(),
                SizedBox(height: 20),
                profileName(context),
                SizedBox(height: 20),
                cardInfo(),
                SizedBox(height: 20),
                textExpenseList(),
                SizedBox(height: 10),
                expenseList(), //..expenseList1() for demo layout
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///...title and search part 1
  Widget titleAndSearch() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/logo_monety.png"),
          maxRadius: 20,
        ),
        SizedBox(width: 5),
        Text(
          "Monety",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Icon(Icons.search_outlined, size: 35),
      ],
    );
  }

  ///...profile pic and this month part 2
  Widget profileName(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            context.read<BottomNavProvider>().index = 4;


          },
          child: Icon(Icons.account_circle, size: 50, color: Colors.black54),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Morning",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            Text(
              "Blaszczykowski",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Spacer(),
        Container(
          height: 35,
          width: 135,
          decoration: BoxDecoration(
            color: Color(0x41A6B5C1),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("This month", style: TextStyle(fontSize: 18)),
              Icon(Icons.expand_more),
            ],
          ),
        ),
      ],
    );
  }

  ///...card part 3
  Widget cardInfo() {
    return Container(
      width: double.infinity,
      height: 170,
      //color: Colors.green,
      child: Card(
        color: Color(0xC75754B1),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Expense total",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      "\$3,734",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade900,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Text(
                            "+\$240",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "than last month",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(
                  "assets/images/bg_monety_preview.png",
                  height: 120,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///...textExpenseList part 4
  Widget textExpenseList() {
    return Align(
      alignment: Alignment(-1, 1),
      child: Text(
        "Expense List",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
      ),
    );
  }

  ///...ExpenseList part 5
  Widget expenseList() {
    return BlocBuilder<ExpenseCubit, ExpenseState>(
      builder: (context, state) {
        List<ExpenseModel> expenseList = state.expenseList;
        //List<ExpenseModel> expenseList = [];
        print(expenseList);

        return expenseList.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: state.expenseList.length,
                itemBuilder: (context, index) {
                  ExpenseModel currExpense = expenseList[index];

                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${df.format(DateTime.fromMillisecondsSinceEpoch(int.parse(currExpense.date)))}",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "-\$1380",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              color: Colors.blue.shade100,
                              child: Icon(CupertinoIcons.cart),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${currExpense.type}",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  "${currExpense.desc}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                            Spacer(),
                            Text(
                              "-${currExpense.moneySpent}",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.pink.shade300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
            : Container(
          height: 150,
          //color: Colors.green,
            child: Center(child: Text("No expense added yet!", style: TextStyle(fontSize: 25, color: Colors.grey),)));
      },
    );
  }

  ///...ExpenseList1 demo
  Widget expenseList1() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (c, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          padding: EdgeInsets.all(8),
          width: double.infinity,
          //height: 200,
          decoration: BoxDecoration(
            //color: Colors.amber,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tuesday, 14",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "-\$1380",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.blue.shade100,
                        child: Icon(CupertinoIcons.cart),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Shop", style: TextStyle(fontSize: 20)),
                          Text(
                            "Buy new clothes",
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                        ],
                      ),
                      Spacer(),
                      Text(
                        "-\$90",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.pink.shade300,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
