import 'dart:async';
import 'dart:convert';
import 'package:happy_tax_man/Constants/APIs.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Model/ExpensesHistoryModel.dart';
import 'package:happy_tax_man/Model/InvoicesHistoryModel.dart';
import 'package:http/http.dart' as Client;

class DashBoardBackend {




  /// this methods sends request to backend and handles response for Dashboard data
  Future<List<ExpensesHistoryModel>> fetchExpenses() async {
    final url = http + baseURL + getExpensesPath;
    var resBody;

    print(url);
    print(json.encode({'account_id' : ResponseData.loginResponse.account_id}));
    try {
      final httpResponse = await Client.post(
        url,
        body: {'account_id' : ResponseData.loginResponse.account_id},
      ).timeout(const Duration(seconds: 30));

      print(json.decode(httpResponse.statusCode.toString()));


      if(httpResponse.statusCode==200){
        ///this checks if statusCode is 200, then if so, it decodes the response
        ///and parse the response to the Response model
        print(httpResponse.body.toString());
        resBody = jsonDecode(httpResponse.body.toString());

        ResponseData.expensesHistoryModel = (resBody as List).map((f) => ExpensesHistoryModel.fromJson(f)).toList();
      }else{

      }

    } on TimeoutException catch (error){
      throw error;

    } catch (error) {
      throw error;

    }
    return ResponseData.expensesHistoryModel;
  }




  /// api call to fetch all invoices

  Future<List<InvoicesHistoryModel>> fetchInvoices(String clientId, invoiceNum) async {
    final url = http + baseURL + listInvoicesPath;
    var resBody;
    print(url);
    print(json.encode({'account_id' : ResponseData.loginResponse.account_id,
      'client_id' : clientId,
      'invoiceno' : invoiceNum,}));
    try {
      final httpResponse = await Client.post(
        url,
        body: {
          'account_id' : ResponseData.loginResponse.account_id,
          'client_id' : clientId,
          'invoiceno' : invoiceNum,

        },
      ).timeout(const Duration(seconds: 30));

      print(json.decode(httpResponse.statusCode.toString()));


      if(httpResponse.statusCode==200){
        ///this checks if statusCode is 200, then if so, it decodes the response
        ///and parse the response to the Response model
        print(httpResponse.body.toString());
        resBody = jsonDecode(httpResponse.body.toString());

        ResponseData.invoicesHistoryList = (resBody as List).map((f) => InvoicesHistoryModel.fromJson(f)).toList();
      }else{

      }

    } on TimeoutException catch (error){
      throw error;

    } catch (error) {
      throw error;

    }
    return ResponseData.invoicesHistoryList;
  }
}
