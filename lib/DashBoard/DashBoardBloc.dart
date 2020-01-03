
import 'package:happy_tax_man/Model/ExpensesHistoryModel.dart';
import 'package:happy_tax_man/Model/InvoicesHistoryModel.dart';
import 'package:happy_tax_man/Repository/DashBoardRespository.dart';
import 'package:rxdart/rxdart.dart';

class DashBoardBloc {
  final DashBoardRepository _repository = DashBoardRepository();
  final BehaviorSubject<List<ExpensesHistoryModel>> _subject = BehaviorSubject<List<ExpensesHistoryModel>>();
  final BehaviorSubject<List<InvoicesHistoryModel>> invoiceSubject = BehaviorSubject<List<InvoicesHistoryModel>>();

  getExpensesData() async {
    List<ExpensesHistoryModel> expensesHistoryModelResponse = await _repository.getExpenses();
    _subject.sink.add(expensesHistoryModelResponse);
  }

  getInvoicesData(String clientId, invoiceNum) async {
    List<InvoicesHistoryModel> invoicesHistoryModelResponse = await _repository.getInvoices(clientId, invoiceNum);
    invoiceSubject.sink.add(invoicesHistoryModelResponse);
  }

  dispose() {
    _subject.close();
    invoiceSubject.close();
  }

  BehaviorSubject<List<ExpensesHistoryModel>> get subject => _subject;

  BehaviorSubject<List<InvoicesHistoryModel>> get invoiceSub => invoiceSubject;
}

final bloc = DashBoardBloc();
