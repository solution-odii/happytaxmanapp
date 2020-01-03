import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Graph/ChartDesign.dart';
import 'package:happy_tax_man/DashBoard/MenuItemsListView.dart';
import 'package:happy_tax_man/Expenses/RecentExpenses/RecentExpensesStream.dart';
import 'package:happy_tax_man/Data/DummyData.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Expenses/AllExpenses/AllExpensesHistory.dart';
import 'package:happy_tax_man/Invoices/AllInvoices/AllInvoicesView.dart';
import 'package:happy_tax_man/Login/LoginPage.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';
import 'package:happy_tax_man/Utils/Styles.dart';
import 'DashBoardBloc.dart';
import 'package:quiver/strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'NavigationDrawerDesign.dart';
import '../Invoices/RecentInvoices/RecentInvoicesStream.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final GlobalKey<ScaffoldState> dashBoardKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    bloc.getExpensesData();
  }

  void logOut(String popUpItem) {
    if (equalsIgnoreCase(popUpItem, "Logout")) {
      navigateReplace(context, LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: dashBoardKey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
        leading: InkWell(
          onTap: () {
            /// on tap of the button, the dashboard state is gotten
            /// the openDrawer method is called to render the drawer view
            dashBoardKey.currentState.openDrawer();
          },
          child: Icon(Icons.menu),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              sayHi + ', ',
              style: textStyleSmallBold,
            ),
            Text(
              ResponseData.loginResponse.username,
              style: textStyleSmalMedium,
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<String>(
                onSelected: logOut,
                icon: Icon(
                  FontAwesomeIcons.signOutAlt,
                  color: Colors.white,
                ),
                itemBuilder: (BuildContext context) {
                  return DummyData.rightMenuOption.map((item) {
                    return PopupMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList();
                }),
          )
        ],
      ),

      /// return the navigation drawer UI
      drawer: NavigationDrawerDesign(),
//      endDrawer: RightMenuDesign(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                children: <Widget>[
//                  InkWell(
//                      onTap: () {
//                        /// on tap of the button, the dashboard state is gotten
//                        /// the openDrawer method is called to render the drawer view
//                        dashBoardKey.currentState.openDrawer();
//                      },
//                      child: Icon(Icons.menu)),
//                  Text(
//                    dashBoard,
//                    style: textStyleBigBold,
//                  ),
//                   InkWell(
//                     onTap: (){
//                       dashBoardKey.currentState.openEndDrawer();
//                     },
//                     child: Icon(
//                          Icons.memory,
//                          size: 22,
//
//                        ),
//                   )
//                ],
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 10.0, 8.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Container(
//                    decoration: BoxDecoration(
//                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                        border: Border.all( color: Colors.grey.withOpacity(.45),)
//                    ),
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Text(
//                            sayHi + ', ',
//                            style: textStyleSmallBold,
//                          ),
//                          Text(
//                            ResponseData.loginResponse.username,
//                            style: textStyleSmalMedium,
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//
            Padding(
              padding: const EdgeInsets.all(8.0),

              /// returns the popular transaction UI
              child: MenuItemListView(),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),

              /// returns the chart UI
              child: buildChartDesign(expenses, 150),
            ),

//            SizedBox(
//              height: 100
//            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//
//              /// returns the popular transaction UI
//              child: MenuItemListView(),
//            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),

              /// returns the recent Expenses
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            recentExpenses,
                            style: textStyleBigSemiBold,
                          ),
                          InkWell(
                            onTap: () =>navigatePush(context, AllExpensesHistory()),
                            child: Text(
                              seeMore,
                              style: TextStyle(
                                  color: AppColors.color2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RecentExpensesStream(),
                ],
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 8.0),

              /// returns the recent Invoices
              child: Column(
                children: <Widget>[
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            recentInvoices,
                            style: textStyleBigSemiBold,
                          ),
                          InkWell(
                            onTap: () =>navigatePush(context, AllInvoicesView()),
                            child: Text(
                              seeMore,
                              style: TextStyle(
                                  color: AppColors.color2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RecentInvoicesStream(clientId: "", invoiceNum: "",),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
