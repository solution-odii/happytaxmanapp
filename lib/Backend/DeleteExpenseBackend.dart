import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:happy_tax_man/Constants/APIs.dart';
import 'package:happy_tax_man/DashBoard/DashBoardScreen.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Model/DeleteExpenseModel.dart';
import 'package:happy_tax_man/Model/ExpensesHistoryModel.dart';
import 'package:happy_tax_man/Utils/AlertDialogs.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';
import 'package:http/http.dart' as Client;


class DeleteExpenseBackend {
  final url = http + baseURL + deleteExpensePath;
  var resBody;



  /// this methods sends request to backend and handles response for Dashboard data
  Future<void> deleteExpenses(BuildContext context, String expenseId) async {
    print(url);
    print(json.encode({'expense_id' : expenseId, 'account_id' : ResponseData.loginResponse.account_id}));
    try {
      final httpResponse = await Client.post(
        url,
        body: {'expense_id' : expenseId, 'account_id' : ResponseData.loginResponse.account_id},
      ).timeout(const Duration(seconds: 20));

      print(json.decode(httpResponse.statusCode.toString()));


      if(httpResponse.statusCode==200){
        ///this checks if statusCode is 200, then if so, it decodes the response
        ///and parse the response to the Response model
        print(httpResponse.body.toString());
        resBody = jsonDecode(httpResponse.body.toString());

        ResponseData.deleteExpenseResponse = DeleteExpenseModel.fromJson(resBody);
        if ("00" == ResponseData.deleteExpenseResponse.response_code){
          await navigateReplace(context, DashBoardScreen());
          showAlertDialog(context, "Expense Deleted Successfully");
        }else if ("199" == ResponseData.updateExpenseResponse.response_code){
          await navigateReplace(context, DashBoardScreen());
          showAlertDialog(context, "Failed to delete Expense");
        }
        else{
         await navigateReplace(context, DashBoardScreen());
          showAlertDialog(context, "Failed to delete Expense");
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
}
