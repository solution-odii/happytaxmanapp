

import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Invoices/SelectedInvoice/InvoiceLineItemDesign.dart';
import 'package:happy_tax_man/Model/InvoiceLineItems.dart';

class InvoiceLineItemList extends StatelessWidget {
  final List<InvoiceLineItems> invoiceLineItemModel ;

  InvoiceLineItemList(this.invoiceLineItemModel);

  @override
  Widget build(BuildContext context) {

    int numberToDisplay = invoiceLineItemModel.length;
    if(numberToDisplay>10){
      numberToDisplay = 10;
    }else{
      numberToDisplay = invoiceLineItemModel.length;
    }


    return Column(
      children: <Widget>[

        numberToDisplay == 0 ?  Center(
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
            height: 400,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                ///this is a list view builder which returns the view for each view
                return new InvoiceLineItemDesign(
                    invoiceLineItemModel[index]);
              },
              itemCount: numberToDisplay,
            ),
          ),
        ),
      ],
    );
  }
}