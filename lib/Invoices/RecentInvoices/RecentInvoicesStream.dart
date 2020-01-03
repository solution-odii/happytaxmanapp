
import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Expenses/RecentExpenses/RecentExpensesListView.dart';
import 'package:happy_tax_man/Model/ExpensesHistoryModel.dart';
import 'package:happy_tax_man/Model/InvoicesHistoryModel.dart';
import '../../DashBoard/DashBoardBloc.dart';
import 'RecentInvoicesListView.dart';


class RecentInvoicesStream extends StatefulWidget {
  final String clientId, invoiceNum;

  const RecentInvoicesStream({this.clientId, this.invoiceNum});

  @override
  RecentInvoicesStreamState createState() => RecentInvoicesStreamState();
}

class RecentInvoicesStreamState extends State<RecentInvoicesStream> {
  /// first method to be run which tells the bloc to fetch dashboard data
  @override
  void initState() {
    super.initState();
    bloc.getInvoicesData(widget.clientId, widget.invoiceNum);
  }

  /// this is a stream builder that subscribes and  listens to a stream for data
  /// and performs functions depending on availability of data
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<InvoicesHistoryModel>>(
      stream: bloc.invoiceSub.stream,
      builder: (context, AsyncSnapshot<List<InvoicesHistoryModel>> snapshot) {
        if (snapshot.hasData) {
          return RecentInvoicesList(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else if (!snapshot.hasData) {
          return Center(child: _buildLoadingWidget());
        } else {
          return Center(child: _buildLoadingWidget());
        }
      },
    );
  }
}

Widget _buildErrorWidget(String error) {
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(connectionError),
        ],
      ));
}

Widget _buildNoDataWidget() {
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(noDataText),
        ],
      ));
}

Widget _buildLoadingWidget() {
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(pleaseWaitText),
          CircularProgressIndicator(
            backgroundColor: AppColors.color1,
            valueColor: new AlwaysStoppedAnimation(Colors.white),
          )
        ],
      ));
}
