
 import 'dart:async';
import 'dart:convert';
import 'package:happy_tax_man/Constants/APIs.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Model/ClientsModel.dart';
import 'package:http/http.dart' as Client;

class ClientsBackend{

   Future<List<ClientsModel>> fetchClients() async {
     final url = http + baseURL + getClientsPath;
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

         ResponseData.clientsList = (resBody as List).map((f) => ClientsModel.fromJson(f)).toList();
       }else{

       }

     } on TimeoutException catch (error){
       throw error;

     } catch (error) {
       throw error;

     }
      return ResponseData.clientsList;
   }
 }