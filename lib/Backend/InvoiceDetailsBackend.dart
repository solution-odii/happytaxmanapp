
import 'dart:convert';
import 'dart:async';
import 'package:happy_tax_man/Constants/APIs.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Model/InvoiceDetailsModel.dart';
import 'package:happy_tax_man/Model/InvoiceLineItems.dart';
import 'package:http/http.dart' as Client;

class InvoiceDetailsBackend{

  Future<List<InvoiceLineItems>> fetchInvoiceDetails(String clientId, invoiceCode) async {
    final url = http + baseURL + getInvoiceDetailsPath;
    var resBody;
    print(url);
    print(json.encode({'account_id' : ResponseData.loginResponse.account_id,
      'client_id' : clientId,
      'invoicecode' : invoiceCode,}));
    try {
      final httpResponse = await Client.post(
        url,
        body: {
          'account_id' : ResponseData.loginResponse.account_id,
          'client_id' : clientId,
          'invoicecode' : invoiceCode,

        },
      ).timeout(const Duration(seconds: 30));

      print(json.decode(httpResponse.statusCode.toString()));


      if(httpResponse.statusCode==200){
        ///this checks if statusCode is 200, then if so, it decodes the response
        ///and parse the response to the Response model
        print(httpResponse.body.toString());
        resBody = jsonDecode(httpResponse.body.toString());

        ResponseData.invoiceDetailsResponse = InvoiceDetailsModel.fromJson(resBody);
        ResponseData.invoiceLineItemList = ResponseData.invoiceDetailsResponse.lineitems;
      }else{

      }

    } on TimeoutException catch (error){
      throw error;

    } catch (error) {
      throw error;

    }

    return ResponseData.invoiceLineItemList;

  }

}

