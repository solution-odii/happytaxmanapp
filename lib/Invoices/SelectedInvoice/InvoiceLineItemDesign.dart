import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Model/InvoiceLineItems.dart';
import 'package:happy_tax_man/Utils/Styles.dart';

class InvoiceLineItemDesign extends StatelessWidget {
  final InvoiceLineItems invoiceLineItems;

  const InvoiceLineItemDesign(this.invoiceLineItems);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          children: <Widget>[
            AppBar(
              leading: Icon(Icons.fiber_manual_record),
              title: Text("Line Item " + invoiceLineItems.txline.toString()),
            ),

            SizedBox(height: 5,),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(description, style: textStyleBigSemiBold),
                        Text(invoiceLineItems.description.toString()),
                      ],
                    ),
                    SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(qtyText, style: textStyleBigSemiBold),
                        Text(invoiceLineItems.qty.toString()),
                      ],
                    ),
                    SizedBox(height: 5,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(priceText, style: textStyleBigSemiBold),
                        Text('${nairaSign + invoiceLineItems.price.toString()}'),
                      ],
                    ),
                    SizedBox(height: 5,),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(taxText, style: textStyleBigSemiBold),
                        Text('${nairaSign + invoiceLineItems.tax.toString()}'),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(subTotalText, style: textStyleBigSemiBold),
                        Text('${nairaSign + invoiceLineItems.linetotal.toString()}'),
                      ],
                    ),
                    SizedBox(height: 5,),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
