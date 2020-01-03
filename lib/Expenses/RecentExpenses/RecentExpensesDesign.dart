import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Expenses/SelectedExpensePage.dart';
import 'package:happy_tax_man/Model/ExpensesHistoryModel.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';
import 'package:happy_tax_man/Utils/Styles.dart';

class RecentExpensesDesign extends StatelessWidget {
  final ExpensesHistoryModel expensesHistoryModel;

  RecentExpensesDesign(this.expensesHistoryModel);

  /// This is the design for each content on the recent transaction history view
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        navigatePush(context, SelectedExpense(
          id: expensesHistoryModel.expenses_id,
          imageURL: expensesHistoryModel.picture,
          cost: expensesHistoryModel.cost,
          expenseClass: expensesHistoryModel.classType,
          dateSubmitted: expensesHistoryModel.date_submited,
          descriptionEntered: expensesHistoryModel.description,
          companyReceiver: expensesHistoryModel.receiver,
          expenseCategory: expensesHistoryModel.expense_type_id,
        ));

      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(expensesHistoryModel.picture),
                        backgroundColor: AppColors.color1,
                        radius: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          expensesHistoryModel.description.toString(),
                          style: textStyleSmallBold,
                        ),
                      ),
                    ],
                  ),
                  Text(expensesHistoryModel.cost.toString(),
                      style: textStyleBigBold),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(left:50.0),
                    child: Text(
                      expensesHistoryModel.date_submited.toString(),
                      style: textStyleSmallRegular,
                    ),
                  ),
                  Text(
                    expensesHistoryModel.classType,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}

//return Padding(
//padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
//child: Column(
//children: <Widget>[
//Row(
//children: <Widget>[
//CircleAvatar(
//child: Image.network(
//expensesHistoryModel.picture,
//alignment: Alignment.center,
//height: 30,
//width: 30,
//),
//radius: 22,
//),
//
//Column(
//
//children: <Widget>[
//Padding(
//padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//children: <Widget>[
//Row(
//mainAxisAlignment: MainAxisAlignment.start,
//children: <Widget>[
//Text(
//expensesHistoryModel.description.toString(),
//style: textStyleSmallBold,
//),
//],),
//
//Row(
//mainAxisAlignment: MainAxisAlignment.end,
//children: <Widget>[
//Text(expensesHistoryModel.cost.toString(),
//style: textStyleBigBold,),
//],),
//
//
//],
//),
//),
//Padding(
//padding: const EdgeInsets.all(8.0),
//child: Row(
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
//children: <Widget>[
//
//Row(children: <Widget>[
//
//Text(
//expensesHistoryModel.date_submited.toString(),
//style: textStyleSmallRegular,
//),
//],),
//
//Row(children: <Widget>[
//Text(
//expensesHistoryModel.classType,
//style: TextStyle(
//color: Colors.green,
//fontSize: 12,
//fontWeight: FontWeight.w200),
//),
//],),
//
//
//
//],
//),
//),
//
//],
//),
//
//],
//),
//
//Divider(
//color: Colors.grey.shade400,
//),
//],
//),
//
//
//);
