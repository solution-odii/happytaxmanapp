
import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Model/ExpensesHistoryModel.dart';
import 'package:happy_tax_man/Utils/Styles.dart';

import 'RecentExpensesDesign.dart';


//class RecentTransactionsList extends StatelessWidget {
//  final DashBoard dashBoard;
//
//  RecentTransactionsList(this.dashBoard);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Column(
//      children: <Widget>[
//        Card(
//          elevation: 0,
//          child: Padding(
//            padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//                Text(
//                  recentTran,
//                  style: textStyleBigSemiBold,
//                ),
//                Text(
//                  seeMore,
//                  style: TextStyle(
//                      color: AppColors.color2,
//                      fontSize: 14,
//                      fontWeight: FontWeight.w500),
//                ),
//              ],
//            ),
//          ),
//        ),
//        Card(
//          elevation: 5,
//          child: SizedBox(
//            height: 350,
//            child: ListView.builder(
//              itemBuilder: (BuildContext context, int index) {
//                ///this is a list view builder which returns the view for each view
//                return new RecentTransactionsDesign(
//                    dashBoard.agentTransactions[index]);
//              },
//              itemCount: dashBoard.agentTransactions.length,
//            ),
//          ),
//        ),
//      ],
//    );
//  }
//}





class RecentExpensesList extends StatelessWidget {
  final List<ExpensesHistoryModel> expensesHistoryModel ;

  RecentExpensesList(this.expensesHistoryModel);

  @override
  Widget build(BuildContext context) {

    int numberToDisplay = expensesHistoryModel.length;
    if(numberToDisplay>10){
      numberToDisplay = 10;
    }else{
      numberToDisplay = expensesHistoryModel.length;
    }


    return Column(
      children: <Widget>[

        numberToDisplay == 0 ?  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(noDataText),
              ],
            ))
            :
        Card(
          elevation: 0,
          child:

          SizedBox(
            height: 150,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                ///this is a list view builder which returns the view for each view
                return new RecentExpensesDesign(
                    expensesHistoryModel[index]);
              },
              itemCount: numberToDisplay,
            ),
          ),
        ),
      ],
    );
  }
}