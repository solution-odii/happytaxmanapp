import 'dart:async';
import 'dart:convert';
import 'package:happy_tax_man/Constants/APIs.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Model/ExpensesCategoryModel.dart';
import 'package:http/http.dart' as Client;

class ExpensesCategoryBackend {
  final url = http + baseURL + getExpensesCategoryPath;
  var resBody;



  /// this methods sends request to backend and handles response for Dashboard data
  Future<List<ExpensesCategoryModel>> fetchExpensesCategory() async {
    print(url);

    try {
      final httpResponse = await Client.post(
        url,
      ).timeout(const Duration(seconds: 20));

      print(json.decode(httpResponse.statusCode.toString()));


      if(httpResponse.statusCode==200){
        ///this checks if statusCode is 200, then if so, it decodes the response
        ///and parse the response to the Response model
        resBody = jsonDecode(httpResponse.body.toString());
        print(resBody);
        ResponseData.expensesCategoryList = (resBody as List).map((f) => ExpensesCategoryModel.fromJson(f)).toList();
      }else{

      }

    } on TimeoutException catch (error){
      throw error;

    } catch (error) {
      throw error;

    }
    return ResponseData.expensesCategoryList;
  }
}
