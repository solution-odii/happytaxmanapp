
import 'package:happy_tax_man/Model/InvoiceDetailsModel.dart';
import 'package:happy_tax_man/Model/InvoiceLineItems.dart';
import 'package:happy_tax_man/Model/InvoicesHistoryModel.dart';
import 'package:happy_tax_man/Repository/DashBoardRespository.dart';
import 'package:happy_tax_man/Repository/InvoiceRepository.dart';
import 'package:rxdart/rxdart.dart';

class InvoicesBloc {
  final DashBoardRepository _repositoryDash = DashBoardRepository();
  final InvoiceRepository _repositoryInvoice = InvoiceRepository();
  final BehaviorSubject<List<InvoicesHistoryModel>> invoiceSubject = BehaviorSubject<List<InvoicesHistoryModel>>();
  final BehaviorSubject<List<InvoiceLineItems>> invoiceDetailsSubject = BehaviorSubject<List<InvoiceLineItems>>();

  getInvoicesData(String clientId, invoiceNum) async {
    List<InvoicesHistoryModel> invoicesHistoryModelResponse = await _repositoryDash.getInvoices(clientId, invoiceNum);
    invoiceSubject.sink.add(invoicesHistoryModelResponse);
  }

  getInvoicesDetails(String clientId, invoiceCode) async {
    List<InvoiceLineItems> invoiceLineItemResponse = await _repositoryInvoice.getInvoiceDetails(clientId, invoiceCode);
    invoiceDetailsSubject.sink.add(invoiceLineItemResponse);
  }

  dispose() {
    invoiceSubject.close();
    invoiceDetailsSubject.close();
  }

  BehaviorSubject<List<InvoicesHistoryModel>> get subjectInvoiceHistory => invoiceSubject;

  BehaviorSubject<List<InvoiceLineItems>> get subjectInvoiceDetails => invoiceDetailsSubject;
}

final invoiceBloc = InvoicesBloc();
