
import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Model/InvoicesHistoryModel.dart';

import 'FilteredInvoicesDesign.dart';





class  FilteredInvoicesList extends StatelessWidget {
  final List<InvoicesHistoryModel> invoiceHistoryModel ;

  FilteredInvoicesList(this.invoiceHistoryModel);

  @override
  Widget build(BuildContext context) {

//    int numberToDisplay = invoiceHistoryModel.length;
//    if(numberToDisplay>10){
//      numberToDisplay = 10;
//    }else{
//      numberToDisplay = invoiceHistoryModel.length;
//    }


    return Column(
      children: <Widget>[

        invoiceHistoryModel.length == 0 ?  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(noDataText),
              ],
            ))
            :
        Card(
          elevation: 0,
          child:

          SizedBox(
            height: 600,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                ///this is a list view builder which returns the view for each view
                return new  FilteredInvoicesDesign(
                    invoiceHistoryModel[index]);
              },
              itemCount: invoiceHistoryModel.length,
            ),
          ),
        ),
      ],
    );
  }
}