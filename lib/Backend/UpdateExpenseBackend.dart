
import 'dart:async';
import 'dart:core' ;
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:happy_tax_man/Constants/APIs.dart';
import 'package:happy_tax_man/DashBoard/DashBoardScreen.dart';
import 'package:happy_tax_man/Data/RequestData.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Model/AddExpenseModel.dart';
import 'package:happy_tax_man/Model/LoginResponse.dart';
import 'package:happy_tax_man/Model/UpdateExpenseModel.dart';
import 'package:happy_tax_man/Utils/AlertDialogs.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';
import 'package:http_parser/http_parser.dart';

import 'package:path/path.dart';
import 'package:http/http.dart' as Client;

class UpdateExpenseBackend {
  final url = http + baseURL + updateExpensePath;
  var resBody;
  LoginResponse loginResponse;



  /// this methods sends request to backend and handles response for Dashboard data
  Future<void> updateExpenseWithImage(BuildContext context, File file, String expenseId) async {

    print(url);
    print("'${file.path}'");
    print(basename(file.path));
    print( basename(file.path).split('.').last.toString());

    print({
      "amount": RequestData.updateExpenseRequestData["amount"],
      "account_id": ResponseData.loginResponse.account_id,
      "category": RequestData.updateExpenseRequestData["category"],
      "description": RequestData.updateExpenseRequestData["description"],
      "company": RequestData.updateExpenseRequestData["company"],
      "expclass": RequestData.updateExpenseRequestData["expclass"],
      "mydate": RequestData.updateExpenseRequestData["mydate"],
      "expense_id": expenseId.toString(),
      "picture":  new Client. MultipartFile.fromBytes(
          'picture',
          file.readAsBytesSync(),
          filename: basename(file.path),
          contentType: MediaType('image', basename(file.path).split('.').last.toString().toLowerCase())
      ),


    });



    try {

      final httpResponse = new  Client.MultipartRequest("POST", Uri.parse(url));
      httpResponse.fields["amount"] = RequestData.updateExpenseRequestData["amount"];
      httpResponse.fields["account_id"] = ResponseData.loginResponse.account_id;
      httpResponse.fields["category"] = RequestData.updateExpenseRequestData["category"];
      httpResponse.fields["description"] = RequestData.updateExpenseRequestData["description"];
      httpResponse.fields["company"] = RequestData.updateExpenseRequestData["company"];
      httpResponse.fields["expclass"] = RequestData.updateExpenseRequestData["expclass"];
      httpResponse.fields["mydate"] = RequestData.updateExpenseRequestData["mydate"];
      httpResponse.fields["expense_id"] = expenseId.toString();

      httpResponse.files.add(new Client. MultipartFile.fromBytes(
          "picture",
          file.readAsBytesSync(),
          filename: basename(file.path),
          contentType: MediaType('image', basename(file.path).split('.').last.toString().toLowerCase())
      ));

      Client.StreamedResponse response = await httpResponse.send();
      print(response.toString());
      var resp = await Client.Response.fromStream(response);
      print(resp.statusCode);
      print(resp.body);





      if(resp.statusCode==200){
        ///this checks if statusCode is 200, then if so, it decodes the response
        ///and parse the response to the Response model
        //resBody = jsonDecode(httpResponse.body.toString());
        print(resp.body);
        ResponseData.updateExpenseResponse = UpdateExpenseModel.fromJson(jsonDecode(resp.body));
        if ("00" == ResponseData.updateExpenseResponse.response_code){
          await navigateReplace(context, DashBoardScreen());
          showAlertDialog(context, "Expense Updated Successfully");
        }else if ("199" == ResponseData.updateExpenseResponse.response_code){
         await navigateReplace(context, DashBoardScreen());
          showAlertDialog(context, "Expense Already added");
        }
        else{
         await navigateReplace(context, DashBoardScreen());
          showAlertDialog(context, "Failed to add Expense");
        }

      }else{
        await navigateReplace(context, DashBoardScreen());
        showAlertDialog(context, 'An Error Occured: Check Internet Connection');
      }

    } on TimeoutException catch (error){
     await navigateReplace(context, DashBoardScreen());
      showAlertDialog(context, 'An Error Occured: Check Internet Connection');
      throw error;

    } catch (error) {
      await navigateReplace(context, DashBoardScreen());
      showAlertDialog(context, 'An Error Occured, please try again');
      throw error;

    }

  }




  Future<void> updateExpenseWithoutImage(BuildContext context, String expenseId) async {

    print(url);


    print({
      "amount": RequestData.updateExpenseRequestData["amount"],
      "account_id": ResponseData.loginResponse.account_id,
      "category": RequestData.updateExpenseRequestData["category"],
      "description": RequestData.updateExpenseRequestData["description"],
      "company": RequestData.updateExpenseRequestData["company"],
      "expclass": RequestData.updateExpenseRequestData["expclass"],
      "mydate": RequestData.updateExpenseRequestData["mydate"],
      "expense_id": expenseId,


    });



    try {

      final httpResponse = new  Client.MultipartRequest("POST", Uri.parse(url));
      httpResponse.fields["amount"] = RequestData.updateExpenseRequestData["amount"];
      httpResponse.fields["account_id"] = ResponseData.loginResponse.account_id;
      httpResponse.fields["category"] = RequestData.updateExpenseRequestData["category"];
      httpResponse.fields["description"] = RequestData.updateExpenseRequestData["description"];
      httpResponse.fields["company"] = RequestData.updateExpenseRequestData["company"];
      httpResponse.fields["expclass"] = RequestData.updateExpenseRequestData["expclass"];
      httpResponse.fields["mydate"] = RequestData.updateExpenseRequestData["mydate"];
      httpResponse.fields["expense_id"] = expenseId;


      Client.StreamedResponse response = await httpResponse.send();
      print(response.toString());
      var resp = await Client.Response.fromStream(response);
      print(resp.statusCode);
      print(resp.body);





      if(resp.statusCode==200){
        ///this checks if statusCode is 200, then if so, it decodes the response
        ///and parse the response to the Response model
        //resBody = jsonDecode(httpResponse.body.toString());
        print(resp.body);
        ResponseData.updateExpenseResponse = UpdateExpenseModel.fromJson(jsonDecode(resp.body));
        if ("00" == ResponseData.updateExpenseResponse.response_code){
          navigateReplace(context, DashBoardScreen());
          showAlertDialog(context, "Expense Updated Successfully");
        }else if ("199" == ResponseData.updateExpenseResponse.response_code){
          navigateReplace(context, DashBoardScreen());
          showAlertDialog(context, "Expense Already added");
        }
        else{
          navigateReplace(context, DashBoardScreen());
          showAlertDialog(context, "Failed to add Expense");
        }

      }else{
        navigateReplace(context, DashBoardScreen());
        showAlertDialog(context, 'An Error Occured: Check Internet Connection');
      }

    } on TimeoutException catch (error){
      navigateReplace(context, DashBoardScreen());
      showAlertDialog(context, 'An Error Occured: Check Internet Connection');
      throw error;

    } catch (error) {
      navigateReplace(context, DashBoardScreen());
      showAlertDialog(context, 'An Error Occured, please try again');
      throw error;

    }

  }
}