import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Invoices/SelectedInvoice/InvoiceLineItemStream.dart';
import 'package:happy_tax_man/Model/InvoicesHistoryModel.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';
import 'package:happy_tax_man/Utils/Styles.dart';


class SelectedInvoicePage extends StatefulWidget {


  final InvoicesHistoryModel invoicesHistoryModel;

  SelectedInvoicePage(this.invoicesHistoryModel);

  @override
  _SelectedInvoicePageState createState() => _SelectedInvoicePageState();
}

class _SelectedInvoicePageState extends State<SelectedInvoicePage> {
  var statusColor;
  var statusTextColor;

  void buildStatusColor(){
    if (
        widget.invoicesHistoryModel.status == 'Paid') {
      statusColor = AppColors.designColor7;
      statusTextColor = AppColors.designColor8;
    } else if(
        widget.invoicesHistoryModel.status == 'unpaid') {
      statusColor = AppColors.designColor5;
      statusTextColor = AppColors.designColor6;

    }
  }

  @override
  Widget build(BuildContext context) {
    buildStatusColor();
    return Scaffold(
      appBar: AppBar(
        leading:   InkWell(
          onTap: (){
            navigateBack(context);
          },
          child: Icon (Icons.arrow_back, color: Colors.white,),
        ),

        title: Text(invoices, style: textStyleBigBoldWhite,  ),
      ),
      body: ListView(
        children: <Widget>[

          Container(
            height: 250,
            decoration: BoxDecoration(
                color: Colors.white
            ),

            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.invoicesHistoryModel.client_name.toString(), style: textStyleBigSemiBoldBlack,),
                    ),

                    Text('${nairaSign + widget.invoicesHistoryModel.amount.toString()}', style: textStyleBigBold,),

                    Text('--------------------------------------------', style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(.60)),),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(dateText, style: textStyleBigRegular,),
                              SizedBox(height: 10,),
                              Text(widget.invoicesHistoryModel.create_date.toString(), style: textStyleSmallSemiBold,),
                            ],
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(invoiceNumberHint, style: textStyleBigRegular,),
                              SizedBox(height: 10,),
                              Text(widget.invoicesHistoryModel.code.toString(), style: textStyleSmallSemiBold,),
                            ],
                          ),
                        ),
                      ],
                    ),



                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(refNumText, style: textStyleBigRegular,),
                              SizedBox(height: 10,),
                              Text(widget.invoicesHistoryModel.refno.toString(), style: textStyleSmallSemiBold,),
                            ],
                          ),
                        ),


                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: statusColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                            child: Text(widget.invoicesHistoryModel.status.toString(),
                              style: TextStyle(
                                  color: statusTextColor,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

//                            SizedBox(height: 10,),
//                            Text('--------------------------------------------', style: TextStyle(fontSize: 14, color: Colors.grey.withOpacity(.60)),),
//
//                            SizedBox(height: 40,),
//
//                            RaisedButton(
//                                onPressed: (){
//                                  navigateBack(context);
//                                },
//                                child: Text(closeText, style: textStyleSmallSemiBold,),
//                                color: Colors.grey.withOpacity(.60),
//                                shape: RoundedRectangleBorder(
//                                    borderRadius: BorderRadius.all(
//                                        Radius.circular(40)),
//                                    side: BorderSide(color: AppColors.color2))
//                            ),

                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InvoiceLineItemStream(
              clientId: widget.invoicesHistoryModel.client_id,
              invoiceCode: widget.invoicesHistoryModel.scode,
            ),
          ),
        ],
      ),


    );
  }
}
