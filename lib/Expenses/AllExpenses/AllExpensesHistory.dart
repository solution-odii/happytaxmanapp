import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/DashBoard/DashBoardBloc.dart';
import 'package:happy_tax_man/Expenses/RecentExpenses/RecentExpensesDesign.dart';
import 'package:happy_tax_man/Model/ExpensesHistoryModel.dart';
import 'package:happy_tax_man/Utils/Styles.dart';

class AllExpensesHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade400,
        centerTitle: true,
        title: Text(
          expenses,
          style: textStyleBigBold,
        ),
      ),
      body: SingleChildScrollView(child: AllExpensesStream()),
    );
  }
}



class AllExpensesStream extends StatefulWidget {
  @override
  AllExpensesStreamState createState() => AllExpensesStreamState();
}

class AllExpensesStreamState extends State<AllExpensesStream> {
  /// first method to be run which tells the bloc to fetch dashboard data
  @override
  void initState() {
    super.initState();
    bloc.getExpensesData();
  }

  /// this is a stream builder that subscribes and  listens to a stream for data
  /// and performs functions depending on availability of data
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ExpensesHistoryModel>>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<List<ExpensesHistoryModel>> snapshot) {
        if (snapshot.hasData) {
          return AllExpensesList(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else if (!snapshot.hasData) {
          return _buildNoDataWidget();
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




class AllExpensesList extends StatelessWidget {
  final List<ExpensesHistoryModel> expensesHistoryModel ;

  AllExpensesList(this.expensesHistoryModel);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Card(
          elevation: 5,
          child: SizedBox(
            height: 650,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                ///this is a list view builder which returns the view for each view
                return new RecentExpensesDesign(
                    expensesHistoryModel[index]);
              },
              itemCount: expensesHistoryModel.length,
            ),
          ),
        ),
      ],
    );
  }
}