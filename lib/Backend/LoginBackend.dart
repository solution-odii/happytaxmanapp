
import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:happy_tax_man/Backend/ClientsBackend.dart';
import 'package:happy_tax_man/Backend/ExpensesCategoryBackend.dart';
import 'package:happy_tax_man/Constants/APIs.dart';
import 'package:happy_tax_man/DashBoard/DashBoardScreen.dart';
import 'package:happy_tax_man/Data/DummyData.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Model/DefaultResponse.dart';
import 'package:happy_tax_man/Model/LoginResponse.dart';
import 'package:happy_tax_man/Utils/AlertDialogs.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginBackend{
  SharedPreferences sharedPreferences;
  var resBody;
  final url = http+baseURL+loginPath;

  /// this methods sends request to backend and handles response for login
  Future<void> signInFetch(BuildContext context, String username, String password, bool isRemembered) async{
    print(url);
    print(json.encode({'username' : username, 'password' : password},));
    try {
      FormData formData = new FormData.fromMap({
        'username' : username,
        'password' : password,

      });
      var httpResponse = await Dio().post(url, data: formData);
      if(httpResponse.statusCode==200){
        ///this checks if statusCode is 200, then if so, it decodes the response
        ///and parse the response to the Response model
        resBody = jsonDecode(httpResponse.data.toString());
        print(resBody);
        ResponseData.defaultResponse = DefaultResponse.fromJson(resBody);


          /// after successful response from backend navigate login screen to dashboard screen if response is not equal to null
        /// if it is null return invalid username and password
        if( ResponseData.defaultResponse.resdata != null){
          /// then parse the Response Model body to the Login Response model
          ResponseData.loginResponse = LoginResponse.fromJson( ResponseData.defaultResponse.resdata);
          print(ResponseData.loginResponse);

          /// save username if isremembered
          if (isRemembered == true){
            saveUsername(username);
            getUsername();
            saveRememberMeStatus(isRemembered);
            getRememberMeStatus();
          }


          navigateReplace(context, DashBoardScreen());


          ExpensesCategoryBackend().fetchExpensesCategory();
          ClientsBackend().fetchClients();

        }else{
          showErrorDialog(context, 'Invalid Username or Password');
          //showErrorDialog(context, 'Invalid Username or Password', navigateBack(context), navigateReplace(context, LoginPage()));
        }


      }else{
        showErrorDialog(context, 'Invalid Username or Password');
        //showErrorDialog(context, 'Error Occurred: Please try logging in again', navigateBack(context), navigateReplace(context, LoginPage()));
      }

    } on TimeoutException catch (error){

      showErrorDialog(context, 'Error: Connection Timeout');
      //showErrorDialog(context, 'Error: Connection Timeout', navigateBack(context), navigateReplace(context, LoginPage()));
      throw error;

    } catch (error) {

      showErrorDialog(context, 'Invalid Username or Password');
      throw error;

    }

  }



  saveUsername(String username) async{
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("Username", username);
  }

  saveRememberMeStatus(bool isRemembered) async{
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isRemembered", isRemembered);
  }


  getUsername() async{
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.username = sharedPreferences.getString("Username");
    print(DummyData.username);


  }

  getRememberMeStatus() async{
    sharedPreferences = await SharedPreferences.getInstance();
    DummyData.isRemembered = sharedPreferences.getBool("isRemembered");
    print(DummyData.isRemembered);
  }

}





























//
//
//class LoginBackend{
//  LoginResponse loginResponse;
//  DefaultResponse.Response response;
//  var resBody;
//  final url = http+baseURL+loginPath;
//
//  /// this methods sends request to backend and handles response for login
//  Future<void> signInFetch(BuildContext context, String username, String password) async{
//    print(url);
//    print(json.encode({'username' : username, 'password' : password},));
//   try {
////      FormData formData = new FormData.fromMap({
////        'username' : username,
////        'password' : password,
////
////      });
//      var httpResponse = await Client.post(
//          url,
//          body: {'username' : username, 'password' : password})
//          .timeout(const Duration(seconds: 20));
//      if(httpResponse.statusCode==200){
//        ///this checks if statusCode is 200, then if so, it decodes the response
//        ///and parse the response to the Response model
//        resBody = jsonDecode(httpResponse.body);
//        print(resBody);
//        response = DefaultResponse.Response.fromJson(resBody);
//        print(response.resdata);
//
//
//        /// after successful response from backend navigate login screen to dashboard screen if response is not equal to null
//        /// if it is null return invalid username and password
//        if(response.resdata != null){
//          /// then parse the Response Model body to the Login Response model
//          loginResponse = LoginResponse.fromJson(response.resdata);
//          print(loginResponse);
//          /// parse the login response model to a static var of the model class
//          ResponseData.loginResponse  = loginResponse;
//          navigatePush(context, DashBoardScreen());
//          ExpensesCategoryBackend().fetchExpensesCategory();
//        }else{
//          showErrorDialog(context, 'Invalid Username or Password');
//          //showErrorDialog(context, 'Invalid Username or Password', navigateBack(context), navigateReplace(context, LoginPage()));
//        }
//
//
//      }else{
//        showErrorDialog(context, 'Invalid Username or Password');
//        //showErrorDialog(context, 'Error Occurred: Please try logging in again', navigateBack(context), navigateReplace(context, LoginPage()));
//      }
//
//    } on TimeoutException catch (error){
//
//      showErrorDialog(context, 'Error: Connection Timeout');
//      //showErrorDialog(context, 'Error: Connection Timeout', navigateBack(context), navigateReplace(context, LoginPage()));
//      throw error;
//
//    } catch (error) {
//      showErrorDialog(context, error.toString());
//      throw error;
//
//    }
//
//  }
//
//}

