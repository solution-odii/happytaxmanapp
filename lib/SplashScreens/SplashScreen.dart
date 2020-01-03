import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Data/DummyData.dart';
import 'package:happy_tax_man/Expenses/AddExpense/AddExpensePage.dart';
import 'package:happy_tax_man/Login/LoginPage.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';
import 'package:happy_tax_man/Utils/Styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  SharedPreferences sharedPreferences;
  bool _first = true;
  double opacity = 1.0;

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  ///Checks if the username exists in the sharedPreferences and then parses it to the login page

  void getUsername()async{
    widget.sharedPreferences = await SharedPreferences.getInstance();
    DummyData.username = widget.sharedPreferences.getString("Username");
    if(DummyData.username==null){
      DummyData.username=usernameHint;
    }else{
      DummyData.username = DummyData.username;
    }
  }

  void getRememberMeStatus()async{
    widget.sharedPreferences = await SharedPreferences.getInstance();
    DummyData.isRemembered = widget.sharedPreferences.getBool("isRemembered");
    if(DummyData.isRemembered!=true){
      DummyData.isRemembered=false;
    }else{
      DummyData.isRemembered = DummyData.isRemembered;
    }
  }

  /// This is the first method that will  be called
  /// and then it calls a method which will delay the page for 3 seconds
  /// and the navigates to the Onboarding page
  @override
  void initState() {
    super.initState();
    getUsername();
    getRememberMeStatus();
    changeOpacity();
    initData().then((onValue) {
      navigateReplace(context, LoginPage());
    });
  }

  /// future delay of 5 seconds
  Future initData() async {
    await Future.delayed(Duration(seconds: 5));
  }

  changeOpacity() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        widget.opacity = widget.opacity == 0.0 ? 1.0 : 0.0;
        changeOpacity();
      });
    });
  }

  /// the view for the splash screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(color: Colors.deepPurple.shade300),
        child: Center(
          child: AnimatedOpacity(
            opacity: widget.opacity == 1 ? 0 : 1,
            duration: Duration(seconds: 1),
            child: Text(
              appName,
              style: textStyleVeryBigBoldWhite,
            ),
          ),
        ),
      ),
    );
  }
}
