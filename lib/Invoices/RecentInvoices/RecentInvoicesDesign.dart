import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:happy_tax_man/Invoices/SelectedInvoice/SelectedInvoicePage.dart';
import 'package:happy_tax_man/Model/InvoicesHistoryModel.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';
import 'package:happy_tax_man/Utils/Styles.dart';

class RecentInvoicesDesign extends StatelessWidget {
  final InvoicesHistoryModel invoicesHistoryModel;

  RecentInvoicesDesign(this.invoicesHistoryModel);

  /// This is the design for each content on the recent invoices history view
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: (){
        navigatePush(context, SelectedInvoicePage(
          invoicesHistoryModel
        ));

      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    invoicesHistoryModel.client_name.toString(),
                    style: textStyleSmallBold,
                  ),

                  Text(invoicesHistoryModel.amount.toString(),
                      style: textStyleBigBold),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Text(
                    invoicesHistoryModel.create_date.toString(),
                    style: textStyleSmallRegular,
                  ),

                  Text(
                    invoicesHistoryModel.status,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.w200),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
