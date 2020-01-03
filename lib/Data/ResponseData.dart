
import 'package:happy_tax_man/Model/AddExpenseModel.dart';
import 'package:happy_tax_man/Model/AddInvoiceModel.dart';
import 'package:happy_tax_man/Model/ClientsModel.dart';
import 'package:happy_tax_man/Model/DefaultResponse.dart';
import 'package:happy_tax_man/Model/DeleteExpenseModel.dart';
import 'package:happy_tax_man/Model/ExpensesCategoryModel.dart';
import 'package:happy_tax_man/Model/ExpensesHistoryModel.dart';
import 'package:happy_tax_man/Model/InvoiceDetailsModel.dart';
import 'package:happy_tax_man/Model/InvoiceLineItems.dart';
import 'package:happy_tax_man/Model/InvoicesHistoryModel.dart';
import 'package:happy_tax_man/Model/LoginResponse.dart';
import 'package:happy_tax_man/Model/UpdateExpenseModel.dart';

class ResponseData {
  static DefaultResponse defaultResponse;
  static LoginResponse loginResponse;
  static List<ExpensesHistoryModel> expensesHistoryModel;
  static List<ExpensesCategoryModel> expensesCategoryList;
  static List<InvoicesHistoryModel> invoicesHistoryList;
  static List<ClientsModel> clientsList;
  static List<InvoiceLineItems> invoiceLineItemList;
  static AddExpenseModel addExpenseModel;
  static AddInvoiceModel addInvoiceResponse;
  static InvoiceDetailsModel invoiceDetailsResponse;
  static DeleteExpenseModel deleteExpenseResponse;
  static UpdateExpenseModel updateExpenseResponse;

}