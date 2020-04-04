import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Data/DummyData.dart';
import 'package:happy_tax_man/Dto/LineItemDTO.dart';
import 'package:happy_tax_man/Invoices/AddInvoice/AddInvoicePage.dart';
import 'package:happy_tax_man/Utils/Styles.dart';

import 'AddInvoiceBloC.dart';

typedef OnDelete();

class LineItemForm extends StatefulWidget {
  final LineItemDto lineItemDto;
  final state = _LineItemFormState();
  final OnDelete onDelete;

  LineItemForm({this.lineItemDto, this.onDelete});

  static double invoiceSubTotal = 0.0;

  @override
  _LineItemFormState createState() => state;

  bool isValid() => state.validate();
}

class _LineItemFormState extends State<LineItemForm> {
  final form = GlobalKey<FormState>();
  String selectedUnit;
  String linetotal = "0.0";
  String linetax = "0.0";
  bool checkStatus = false;
  final controllerPrice = TextEditingController();
  final controllerQty = TextEditingController();

  calculateLineTotal(String price, qty, bool isTaxChecked) {
    double unitPrice = double.parse(price);
    double unitQty = double.parse(qty);

    double lineTotal = unitPrice * unitQty;

    if (isTaxChecked == true) {
      double lineTax = unitPrice * unitQty * DummyData.tax;
      widget.lineItemDto.lineTax = lineTax.toString();
    } else {
      widget.lineItemDto.lineTax = "0.0";
    }

    setState(() {
      linetotal = lineTotal.toString();

      //addInvoiceBloc.calculateSubTotal(double.parse(linetotal));
      //LineItemForm.invoiceSubTotal = lineTotal+LineItemForm.invoiceSubTotal;
    });
    print(LineItemForm.invoiceSubTotal);
  }

  @override
  Widget build(BuildContext context) {
    if (checkStatus == false) {
      widget.lineItemDto.isTax = "0";
    }
    return Center(
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 10),
        child: Material(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(8),
          child: Center(
            child: Form(
              key: form,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 300,
                    color: AppColors.color1,
                    child: ListTile(
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Checkbox(
                          value: checkStatus,
                          onChanged: (bool value) {
                            setState(() {
                              checkStatus = value;
                              if (checkStatus == true) {
                                widget.lineItemDto.isTax = "1";
                              } else {
                                widget.lineItemDto.isTax = "0";
                              }
                            });
                          },
                          activeColor: AppColors.color5,
                          checkColor: Colors.white,
                        ),
                      ),
                      title: Text(
                        "Inc Tax",
                        style: textStyleSmallBoldWhite,
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.white,
                        onPressed: widget.onDelete,
                      ),
                    ),
                  ),
                  Container(
                    height: 350,
                    width: 300,
                    child: Center(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
//                  initialValue: widget.lineItemDto.qty,
                                onSaved: (val) => widget.lineItemDto.price =
                                    controllerPrice.text,
                                validator: (val) =>
                                    val.isNotEmpty ? null : formErrorText,
                                keyboardType: TextInputType.number,
                                controller: controllerPrice,
                                onChanged: (value) {
                                  addInvoiceBloc.changeVisibilityTwo();
                                  setState(() {
                                    //AddInvoicePageState().changeVisibilityTwo();
                                    calculateLineTotal(
                                        value, controllerQty.text, checkStatus);
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      10.0, 15.0, 20.0, 15.0),
                                  hintText: priceText,
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 80,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
//                  initialValue: widget.lineItemDto.qty,
                                onSaved: (val) =>
                                    widget.lineItemDto.qty = controllerQty.text,
                                validator: (val) =>
                                    val.isNotEmpty ? null : formErrorText,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    addInvoiceBloc.changeVisibilityTwo();
                                    calculateLineTotal(controllerPrice.text,
                                        value, checkStatus);
                                  });
                                },
                                controller: controllerQty,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      10.0, 15.0, 20.0, 15.0),
                                  hintText: qtyText,
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
//                  initialValue: widget.lineItemDto.qty,
                                onSaved: (val) =>
                                    widget.lineItemDto.description = val,
                                validator: (val) =>
                                    val.isNotEmpty ? null : formErrorText,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      10.0, 15.0, 20.0, 15.0),
                                  hintText: descriptionHint,
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.grey)),
                              child: DropdownButtonHideUnderline(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 12.0, left: 10),
                                  child: DropdownButton<String>(
                                      value: selectedUnit,
                                      iconEnabledColor: AppColors.color1,
                                      hint: Text(
                                        unitText,
                                        style: textStyleBigRegular,
                                      ),
                                      isExpanded: true,
                                      onChanged: (newValue) {
                                        setState(() {
                                          selectedUnit = newValue;
                                          widget.lineItemDto.unit =
                                              selectedUnit;
                                          addInvoiceBloc.changeVisibilityOne();
                                        });
                                      },
                                      items: DummyData.unitOption.map((option) {
                                        return DropdownMenuItem<String>(
                                          value: option,
                                          child: Text(
                                            option.toString(),
                                            style: textStyleBigRegular,
                                          ),
                                        );
                                      }).toList()),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(color: Colors.grey)),
                              child: TextFormField(
                                // initialValue: linetotal,
                                enabled: false,
                                onSaved: (val) =>
                                    widget.lineItemDto.lineTotal = linetotal,
//                          validator: (val) =>
//                          val.isEmpty ? null : formErrorText,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(
                                      10.0, 15.0, 20.0, 15.0),
                                  hintText: linetotal,
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///form validator
  bool validate() {
    var valid = form.currentState.validate();
    if (valid) form.currentState.save();
    return valid;
  }
}
