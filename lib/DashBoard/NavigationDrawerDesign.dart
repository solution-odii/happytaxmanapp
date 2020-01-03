
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Expenses/AddExpense/AddExpensePage.dart';
import 'package:happy_tax_man/Invoices/AddInvoice/AddInvoicePage.dart';
import 'package:happy_tax_man/Invoices/AllInvoices/AllInvoicesView.dart';
import 'package:happy_tax_man/Login/LoginPage.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';
import 'package:happy_tax_man/Utils/OvalRightBorderClipper.dart';
import 'package:happy_tax_man/Utils/Styles.dart';

class NavigationDrawerDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: AppColors.color1,
                      backgroundImage: AssetImage(
                        assetImageAvatarBoy,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    ResponseData.loginResponse.username.toString(),
                    style: textStyleBigBold,
                  ),
//                  Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                      Text(
//                        agentIdText,
//                        style: textStyleBigMedium,
//                      ),
//                      Text(
//                        ModelData.agentID,
//                        style: textStyleSmalMedium,
//                      ),
//                    ],
//                  ),

                  SizedBox(height: 30.0),

                  /// the design of the navigation drawer menu
                  _buildRow(FontAwesomeIcons.coins, addExpense, context,
                      AddExpensePage()),
                  _buildDivider(),
                  _buildRow(FontAwesomeIcons.receipt, addInvoices, context,
                      AddInvoicePage()),
                  _buildDivider(),
                  _buildRow(FontAwesomeIcons.wpforms, addClient, context,
                      AddExpensePage()),
                  _buildDivider(),
                  _buildRow(FontAwesomeIcons.amazonPay, addPaymentInfo, context,
                      AddExpensePage()),
                  _buildDivider(),
                  _buildRow(FontAwesomeIcons.search, searchInvoices, context,
                      AllInvoicesView()),
                  _buildDivider(),
                  SizedBox(
                    height: 50,
                  ),
                  _buildRow(
                      FontAwesomeIcons.signOutAlt, logOut, context, LoginPage()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// the design set for the menu item in the drawer
Widget _buildRow(
    IconData iconData, String title, BuildContext context, Widget widget) {
  return InkWell(
    onTap: () {
      navigateReplace(context, widget);
    },
    child: Container(
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: [
        Icon(iconData, color: AppColors.color1,),
        SizedBox(width: 10.0),
        Text(
          title,
          style: textStyleSmallSemiBold,
        ),
      ]),
    ),
  );
}

/// this method renders a line to separate each row in the column
Divider _buildDivider() {
  return Divider(
    color: Colors.grey.shade400,
  );
}
