import 'package:flutter/material.dart';
import 'package:happy_tax_man/Backend/AddInvoiceBackend.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/AppColors.dart' as prefix0;
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Dto/LineItemDTO.dart';
import 'package:happy_tax_man/Invoices/AddInvoice/AddInvoiceBloC.dart';
import 'package:happy_tax_man/Model/ClientsModel.dart';
import 'package:happy_tax_man/Utils/AlertDialogs.dart';
import 'package:happy_tax_man/Utils/Styles.dart';
import 'package:happy_tax_man/Utils/Widgets.dart';

import 'LineItemForm.dart';

class AddInvoicePage extends StatefulWidget {
  static double subtotal = 0.0;
  static double tax = 0.0;
  static double total = 0.0;
  @override
  AddInvoicePageState createState() => AddInvoicePageState();
}

class AddInvoicePageState extends State<AddInvoicePage> {
  List<LineItemForm> lineItemsForm = [];
  var lineItemData;
  List<String> qtyList  = [];
  List<String> uPriceList  = [];
  List<String> unitList  = [];
  List<String> descList  = [];
  List<String> lineTotalList  = [];
  List<String> lineTaxList  = [];
  List<String> isTaxList  = [];
  final topFormKey = GlobalKey<FormState>();
  String showSelectedClientName = selectClientHint;
  String clientId;
  final invoiceNumberController = TextEditingController();
  final refNumberController = TextEditingController();

  double subtotal = 0.0;
  double tax = 0.0;
  double grandTotal = 0.0;
  bool isLoading = false;
  AddInvoiceBloc addInvoiceBloc = new AddInvoiceBloc(isTotalVisible: false, isSave: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: AppColors.color5,
        centerTitle: true,
        title: Text(addInvoices, style: textStyleBigBoldWhite,  ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey)
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
                              clientId = newValue.client_id;
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

              Form(
                key: topFormKey,
                child: Container(
                  height: 70,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        width: 200,
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding:
                            const EdgeInsets.only(
                                left: 20.0, top: 5, bottom: 5),
                            child: formFieldTwo(invoiceNumberHint, invoiceNumberController),
                          ),),
                      ),

                      Container(
                        width: 200,
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 5, bottom: 5),
                            child: formFieldTwo(refNumberHint, refNumberController),
                          ),),
                      ),
                    ],
                  ),
                ),
              ),




              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(addItemText, style: textStyleBigSemiBold),
                    SizedBox(width: 10,),
                    FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: onAddForm,
                      foregroundColor: Colors.white,
                      backgroundColor: AppColors.color1,

                    ),



                  ],
                ),
              ),
               lineItemsForm.length <= 0
                  ? Center(
                child: Text(
                  'No Invoice Item'
                ),
              )
                  :
              SizedBox(
                height: 450,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  addAutomaticKeepAlives: true,
                  itemCount: lineItemsForm.length,
                  itemBuilder: (_, index) => lineItemsForm[index],
                ),
              ),

              StreamBuilder(
                stream: addInvoiceBloc.isTotalVisibleObservable,
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  return Visibility(
                    visible: snapshot.data ==null ? false : snapshot.data,
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(subTotalText, style: textStyleBigSemiBold),
                                Text('${nairaSign + subtotal.toString()}'),
//                            StreamBuilder(
//                                stream: addInvoiceBloc.subTotalObservable,
//                                builder: (context, AsyncSnapshot<double> snapshot) {
//                                  return Text('${nairaSign + snapshot.data.toString()}');
//                                }
//                            ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(taxText, style: textStyleBigSemiBold),
                                Text('${nairaSign + tax.toString()}'),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(totalText, style: textStyleBigSemiBold),
                                Text('${nairaSign + grandTotal.toString()}'),
                              ],
                            ),
                          ),

                          SizedBox(height: 10,),

                          isLoading
                              ? CircularProgressIndicator(
                            backgroundColor: prefix0.AppColors.color1,
                            valueColor: new AlwaysStoppedAnimation(Colors.white),
                          )
                              :
                          RaisedButton(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            color: AppColors.color1,
                            onPressed: () {
                              submitForm(context);
                            },
                            elevation: 11,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(40.0))),
                            child: Text(submit,
                                style: TextStyle(
                                    color: Colors.white
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),



            SizedBox(
              height: 10,
            ),
              StreamBuilder<bool>(
                stream: addInvoiceBloc.isSaveChecker.stream,
                builder: (context, AsyncSnapshot<bool> snapshot) {
                  return Visibility(
                    visible:  lineItemsForm.length <= 0 ? false : snapshot.data,
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      color: AppColors.color1,
                      onPressed: () {
                          onSave();
                      },
                      elevation: 11,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(40.0))),
                      child: Text(save,
                          style: TextStyle(
                          color: Colors.white
                      )),
                    ),
                  );
                }
              ),

              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),

    );
  }




  ///on form user deleted
  void onDelete(LineItemDto lineItemDto) {
    setState(() {
      var find = lineItemsForm.firstWhere(
            (it) => it.lineItemDto == lineItemDto,
        orElse: () => null,
      );
      if (find != null) lineItemsForm.removeAt(lineItemsForm.indexOf(find));
    });
  }

  ///on add form
  void onAddForm() {
    subtotal = 0.0;
    tax = 0.0;
    addInvoiceBloc.changeVisibilityTwo();
    setState(() {
      var lineItem = LineItemDto();
      lineItemsForm.add(LineItemForm(
        lineItemDto: lineItem,
        onDelete: () => onDelete(lineItem),
      ));
    });
  }

  ///on save forms
  void onSave() {

    if (lineItemsForm.length > 0) {
      var allValid = true;
      lineItemsForm.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        int i = 0;
        lineItemData = lineItemsForm.map((it) => it.lineItemDto).toList();
        //print(lineItemData.length);

        for(i = 0; i<lineItemsForm.length; i++){
          subtotal += double.parse(lineItemData[i].lineTotal);
          tax += double.parse(lineItemData[i].lineTax);

        }

          grandTotal = subtotal + tax;
          print(subtotal);
          print(tax);
          print(grandTotal);

          addInvoiceBloc.changeVisibilityOne();

      }
    }
  }


  void submitForm(BuildContext context) async{
    String invoiceNumber = invoiceNumberController.text;
    String refNumber = refNumberController.text;
    int i = 0;
    if (!topFormKey.currentState.validate()) {

    }else if(clientId == null){
      showAlertDialog(context, 'Pls choose a Client');
    } else {
      topFormKey.currentState.save();

      for(i = 0; i<lineItemsForm.length; i++){

        //qty.insert(i, lineItemData[i].qty);
        qtyList.add(lineItemData[i].qty);
        uPriceList.add(lineItemData[i].price);
        unitList.add(lineItemData[i].unit);
        descList.add(lineItemData[i].description);
        lineTotalList.add(lineItemData[i].lineTotal);
        lineTaxList.add(lineItemData[i].lineTax);
        isTaxList.add(lineItemData[i].isTax);

      }
      //print(qtyList);
      setState(() {
        isLoading = true;
      });

      await AddInvoiceBackend().addInvoice(
          context,
          lineItemsForm.length,
          grandTotal.toString(),
          subtotal.toString(),
          tax.toString(),
          refNumber,
          invoiceNumber,
          clientId,
          qtyList,
          uPriceList,
          unitList,
          descList,
          lineTotalList,
          lineTaxList,
          isTaxList,
      ).catchError(((onError) {
        qtyList.clear();
        uPriceList.clear();
        unitList.clear();
        descList.clear();
        lineTotalList.clear();
        lineTaxList.clear();
        isTaxList.clear();

        setState(() {
          isLoading = false;
        });
      }));


      setState(() {
        isLoading = false;
      });

      qtyList.clear();
      uPriceList.clear();
      unitList.clear();
      descList.clear();
      lineTotalList.clear();
      lineTaxList.clear();
      isTaxList.clear();

    }
  }


}






