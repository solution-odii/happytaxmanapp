//import 'package:fcmb_agency_mobile/Backend/LoginAuth.dart';
//import 'package:fcmb_agency_mobile/Models/LoginResponse.dart';
//class Repository{
//  LoginAuth loginAuth = LoginAuth();
//
//  Future<LoginResponse> userLogin(){
//    return loginAuth.signInFetch(loginBody);
//  }
//
//}



import 'package:happy_tax_man/Backend/DashBoardBackend.dart';
import 'package:happy_tax_man/Model/ExpensesHistoryModel.dart';
import 'package:happy_tax_man/Model/InvoicesHistoryModel.dart';

class DashBoardRepository{
  DashBoardBackend apiProvider = DashBoardBackend();

  /// This method calls the backend to fetchExpenses
  Future<List<ExpensesHistoryModel>> getExpenses(){
    return apiProvider.fetchExpenses();
  }

  /// This method calls the backend to fetchInvoices
  Future<List<InvoicesHistoryModel>> getInvoices(String clientId, invoiceNum){
    return apiProvider.fetchInvoices(clientId, invoiceNum);
  }

}