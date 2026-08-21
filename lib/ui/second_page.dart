import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget{

  List<Map<String, List>> expenseData = [

    {
      "Tuesday, 14": [
        {
          "title": "Shop",
          "desc": "Buy new clothes",
          "total": "-\$90",
          "icon": CupertinoIcons.shopping_cart,
        },
        {
          "title": "Electronic",
          "desc": "Buy new iphone 14",
          "total": "-\$1290",
          "icon": Icons.smartphone,
        },
      ]
    },

    {
      "Monday, 13": [
        {
          "title": "Transportation",
          "desc": "Trip to Malang",
          "total": "-\$60",
          "icon": Icons.directions_car,
        },
      ]
    },

    {
      "Sunday, 12": [
        {
          "title": "Groceries",
          "desc": "Weekly shopping",
          "total": "-\$180",
          "icon": Icons.shopping_basket,
        },
        {
          "title": "Fuel",
          "desc": "Petrol refill",
          "total": "-\$70",
          "icon": Icons.local_gas_station,
        },
      ]
    },

    {
      "Saturday, 11": [
        {
          "title": "Netflix",
          "desc": "Monthly subscription",
          "total": "-\$15",
          "icon": Icons.tv,
        },
        {
          "title": "Gym",
          "desc": "Membership renewal",
          "total": "-\$45",
          "icon": Icons.fitness_center,
        },
        {
          "title": "Medicine",
          "desc": "Pharmacy",
          "total": "-\$28",
          "icon": Icons.local_hospital,
        },
      ]
    },

    {
      "Friday, 10": [
        {
          "title": "Electricity",
          "desc": "Monthly bill",
          "total": "-\$120",
          "icon": Icons.electric_bolt,
        },
        {
          "title": "Internet",
          "desc": "Broadband recharge",
          "total": "-\$40",
          "icon": Icons.wifi,
        },
      ]
    }

  ];

  @override
  Widget build(BuildContext context) {
    //print(expenseData[3][expenseData[3].keys.first]![0]["title"]);

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
                  lastBtn()
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
              Icon(Icons.arrow_downward_sharp)
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
  Widget gridPart() => GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          childAspectRatio: 2/1,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20

      ),itemCount: expenseData.length,
      itemBuilder: (context, index){


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
                child: Icon(expenseData[index][expenseData[index].keys.first]![0]["icon"]),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(expenseData[index][expenseData[index].keys.first]![0]["title"], style:
                    TextStyle(
                        fontSize: 20
                    ),overflow: TextOverflow.ellipsis, maxLines: 1,
                    ),
                    Text(expenseData[index][expenseData[index].keys.first]![0]["total"], style:
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

  ///...lastBtns part ..10
  Widget lastBtn(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.home, size: 30, color: Colors.grey),
        Icon(Icons.auto_graph, size: 30, color: Colors.pinkAccent.shade100),
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.pinkAccent.shade100,
                borderRadius: BorderRadius.circular(5)
            ),
            child: Icon(Icons.add, size: 30, color: Colors.white)),
        Icon(CupertinoIcons.bell, size: 30, color: Colors.grey),
        Icon(Icons.account_circle_outlined, size: 30, color: Colors.grey),

      ],
    );
  }

}