
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Invoices/InvoicesBLoC.dart';
import 'package:happy_tax_man/Model/ClientsModel.dart';
import 'package:happy_tax_man/Utils/Styles.dart';
import 'package:happy_tax_man/Utils/Widgets.dart';

class AllInvoicesAppBarDesign extends StatefulWidget {
   String invoiceNumber;
   String refNumber;
   String clientId = "";

  @override
  _AllInvoicesAppBarDesignState createState() => _AllInvoicesAppBarDesignState();
}

class _AllInvoicesAppBarDesignState extends State<AllInvoicesAppBarDesign> {
  String showSelectedClientName = selectClientHint;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Form(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.white)
                      ),
                      child: TextFormField(
                        enabled: true,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.black,
                        style: textStyleSmallBoldWhite,
                        validator: (value) {
                          if (value.isEmpty) {
                            return formErrorText;
                          }
                          return null;
                        },
                        onSaved: (value) {
                          widget.invoiceNumber = value;
                        },
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                            hintText: invoiceNumberHint,
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.white)
                    ),
                  child: DropdownButtonHideUnderline(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12.0, left: 10),
                      child: DropdownButton<ClientsModel>(
                          value: null,
                          iconEnabledColor: AppColors.color1,
                          hint: Text(showSelectedClientName, style: textStyleBigRegular,),
                          isExpanded: true,
                          onChanged: (newValue) {
                            setState(() {
                              showSelectedClientName = newValue.client_name;
                              widget.clientId = newValue.client_id;
                            });
                          },
                          items: ResponseData.clientsList.map((option) {
                            return DropdownMenuItem<ClientsModel>(
                              value: option,
                              child: Text(
                                option.client_name.toString(),
                                style: textStyleBigRegular,
                              ),
                            );
                          }).toList()),
                    ),
                  ),
                ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                MaterialButton(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  color: AppColors.color1,
                  onPressed: (){
                    formKey.currentState.save();
                    invoiceBloc.getInvoicesData(widget.clientId, widget.invoiceNumber);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(search, style: textStyleSmallBoldWhite,),
                  ),
                )
            ],)
          ],
        ),
      ),
    );
  }
}