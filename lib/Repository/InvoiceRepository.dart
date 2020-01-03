
import 'package:happy_tax_man/Backend/InvoiceDetailsBackend.dart';
import 'package:happy_tax_man/Model/InvoiceDetailsModel.dart';
import 'package:happy_tax_man/Model/InvoiceLineItems.dart';

class InvoiceRepository{
  InvoiceDetailsBackend apiProvider = InvoiceDetailsBackend();

  /// This method calls the backend to fetchInvoice Details
  Future<List<InvoiceLineItems>> getInvoiceDetails(String clientId, invoiceCode){
    return apiProvider.fetchInvoiceDetails(clientId, invoiceCode);
  }


}