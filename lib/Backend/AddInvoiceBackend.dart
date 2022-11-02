import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:happy_tax_man/DashBoard/DashBoardScreen.dart';
import 'package:happy_tax_man/Model/AddInvoiceModel.dart';
import 'package:happy_tax_man/Utils/AlertDialogs.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';

import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/APIs.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:http/http.dart' as Client;


class AddInvoiceBackend{
  final url = http + baseURL + addInvoicePath;
  var resBody;



  /// this methods sends request to backend and handles response for Dashboard data
  Future<void> addInvoice(BuildContext context, int lineItemLength, String total, subTotal, tax, ref, invoiceCode, clientId, List<String> qty, List<String> uPrice, List<String> unit, List<String> desc, List<String> lineTotal, List<String> lineTax, List<String> isTax) async {

//    print({
//      'account_id' : ResponseData.loginResponse.account_id,
//      'gtotal' : total,
//      'stotal' : subTotal,
//      'action' : "new",
//      'notes' : "nil",
//      'stax' : tax,
//      'invoiceref' : ref,
//      'invoiceno' : invoiceCode,
//      'client' : clientId,
//      'qtystr[]' : qty.toString(),
//      'uprice[]' : uPrice.toString(),
//      'unit[]' : unit.toString(),
//      'description[]' : desc.toString(),
//      'total[]' : lineTotal.toString(),
//      'itemtax[]' : lineTax.toString(),
//      'taxchk[]' : isTax.toString(),
//    });



    try {
      FormData formData = new FormData();
      formData.fields.add(MapEntry("account_id", ResponseData.loginResponse.account_id.toString()));
      formData.fields.add(MapEntry("gtotal", total.toString()));
      formData.fields.add(MapEntry("stotal", subTotal.toString()));
      formData.fields.add(MapEntry("action", "new"));
      formData.fields.add(MapEntry("notes", ""));
      formData.fields.add(MapEntry("stax", tax.toString()));
      formData.fields.add(MapEntry("invoiceref", ref.toString()));
      formData.fields.add(MapEntry("invoiceno", invoiceCode.toString()));
      formData.fields.add(MapEntry("client", clientId.toString()));

      for(int i = 0; i<lineItemLength; i++){
        formData.fields.add(MapEntry("qtystr[]", qty[i].toString()));
        formData.fields.add(MapEntry("uprice[]", uPrice[i].toString()));
        formData.fields.add(MapEntry("unit[]", unit[i].toString()));
        formData.fields.add(MapEntry("description[]", desc[i].toString()));
        formData.fields.add(MapEntry("total[]", lineTotal[i].toString()));
        formData.fields.add(MapEntry("itemtax[]", lineTax[i].toString()));
        formData.fields.add(MapEntry("taxchk[]", isTax[i].toString()));
      }
      print(url);
      print(formData);

      var httpResponse = await Dio().post(url, data: formData).timeout(const Duration(seconds: 20));
      print(json.decode(httpResponse.statusCode.toString()));
      print(json.decode(httpResponse.data.toString()));


      if(httpResponse.statusCode==200){
        ///this checks if statusCode is 200, then if so, it decodes the response
        ///and parse the response to the Response model
        print(httpResponse.data.toString());
        resBody = jsonDecode(httpResponse.data.toString());

        ResponseData.addInvoiceResponse = AddInvoiceModel.fromJson(resBody);
        if ("00" == ResponseData.addInvoiceResponse.response_code){
          await navigatePush(context, DashBoardScreen());
          showAlertDialog(context, "Invoice Added Successfully");
        }else if ("101" == ResponseData.addInvoiceResponse.response_code){
         // navigateReplace(context, DashBoardScreen());
          showAlertDialog(context, ResponseData.addInvoiceResponse.response_description.toString());
        }
        else{
          //navigateReplace(context, DashBoardScreen());
          showAlertDialog(context, "Failed to Add Invoice");
        }

      }else{
        //navigateReplace(context, DashBoardScreen());
        showAlertDialog(context, 'An Error Occured: Check Internet Connection');
      }

    } on TimeoutException catch (error){
      //navigateReplace(context, DashBoardScreen());
      showAlertDialog(context, 'An Error Occured: Check Internet Connection');
      throw error;

    } catch (error) {
      //navigateReplace(context, DashBoardScreen());
      showAlertDialog(context, 'An Error Occured, please try again');
      throw error;

    }

  }
}