
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_tax_man/Backend/LoginBackend.dart';
import 'package:happy_tax_man/Constants/AppColors.dart' as prefix0;
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/DashBoard/DashBoardScreen.dart';
import 'package:happy_tax_man/Data/DummyData.dart';
import 'package:happy_tax_man/Login/LoginPageDesignComponents.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';
import 'package:happy_tax_man/Utils/Styles.dart';

class LoginPage extends StatefulWidget{


  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  //final controllerUsername = TextEditingController();

  final controllerPassword = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey();

  bool isLoading = false;
  bool checkStatus = DummyData.isRemembered;
  static String username;
  static String password;

  stopLoader(){
    setState(() {
      isLoading = false;
    });

}

  /// this method saves the form details,
  /// set the loader to true,
  /// then sends login details to the back end,
  /// on success from backend loader is now set to false
  ///

  Future<void> _submitLogin() async {
    if (!loginFormKey.currentState.validate()) {

    } else {
      loginFormKey.currentState.save();
      //username = controllerUsername.text.toString();
      password = controllerPassword.text.toString();
      setState(() {
        isLoading = true;
      });

      await LoginBackend().signInFetch(context, username, password, checkStatus);

      stopLoader();
    }
  }

   initialValue(){
    if (DummyData.username!=usernameHint)
      return DummyData.username;
  }

  hintUserName(){
    if (DummyData.username==usernameHint)
      return DummyData.username;
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            waveView(),
            SingleChildScrollView(
              child:
              Column(
                children: <Widget>[
                  Container(
                    height: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(appName, textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0
                            )),

                        Text(login, textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 28.0
                            )),

                        Form(
                            key: loginFormKey,
                            child: Column(children: <Widget>[
//                              formViewOne(Icons.person, hintUserName(),
//                                  TextInputType.text, false, controllerUsername, initialValue(), username),

                            Card(
                            margin: EdgeInsets.only(left: 30, right:30, top:30),
                          elevation: 11,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 2, bottom: 2),
                            child: TextFormField(
                              initialValue: initialValue(),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person, color: Colors.black26,),
                                  hintText: hintUserName(),
                                  hintStyle: TextStyle(color: Colors.black26),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                              ),
                              keyboardType: TextInputType.text,
                             // controller: controllerUsername,
                              obscureText: false,
                              cursorColor: prefix0.AppColors.color2,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return formErrorText;
                                }
                                return null;
                              },
                              onSaved: (value){
                                username = value;
                              },
                            ),
                          ),
                        ),
                              formViewTwo(
                                  Icons.lock, passwordHint, TextInputType.number,
                                  true, controllerPassword, password),

                            ],)),

                        SizedBox(
                            height: 10
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: <Widget>[
                              Checkbox(
                                value: checkStatus,
                                onChanged: (bool value) {
                                  setState(() {
                                    checkStatus = value;
                                  });
                                },
                                activeColor: AppColors.color1,
                                checkColor: Colors.white,
                              ),
                              Text(
                                rememberMeText,
                                style: textStyleSmallBoldWhite,
                              )
                            ],
                          ),
                        ),



                        isLoading
                            ? CircularProgressIndicator(
                          backgroundColor: prefix0.AppColors.color1,
                          valueColor: new AlwaysStoppedAnimation(Colors.white),
                        )
                            :
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(30.0),
                          child: RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            color: prefix0.AppColors.color1,
                            onPressed: () {
                              _submitLogin();
                              //navigatePush(context, DashBoardScreen());
                            },
                            elevation: 11,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(40.0))),
                            child: Text(login, style: TextStyle(
                                color: Colors.white
                            )),
                          ),
                        ),
                        Text(forgotPassword, style: TextStyle(
                            color: Colors.black
                        ))
                      ],
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

                        SizedBox(height: 20.0,),
                        Row(
                          children: <Widget>[
                            SizedBox(width: 20.0,),
                            Expanded(
                              child: Text(haveAccount),
                            ),
                            SizedBox(width: 10.0,),
                            Expanded(
                              child: RaisedButton(
                                child: Text(signUp),
                                textColor: Colors.white,
                                color: Colors.indigo,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(40)),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 20.0,),
                          ],
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
