import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:happy_tax_man/Backend/AddExpenseBackend.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Data/RequestData.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Expenses/AddExpense/AddExpenseDesignComponents.dart';
import 'package:happy_tax_man/Model/ExpensesCategoryModel.dart';
import 'package:happy_tax_man/Utils/AlertDialogs.dart';
import 'package:happy_tax_man/Utils/Styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


class AddExpensePage extends StatefulWidget {

  @override
  _AddExpensePageState createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  bool checkStatusOne = false;
  bool checkStatusTwo = false;
  String selectedCategory;
  String selectedBusiness;
  String showSelectedCategory = categoryHintText;
  final controllerDescription = TextEditingController();
  File file1;
  DateTime selectedDate = DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  String dateGet;
  final GlobalKey<FormState> formKey = GlobalKey();
  ExpensesCategoryModel expensesCategory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: AppColors.color5,
        centerTitle: true,
        title: Text(addExpense, style: textStyleBigBoldWhite,  ),
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(typeOfBusinessHintText, style: textStyleBigSemiBold,),

                  buildCheckbox(business, checkStatusOne),
                  buildCheckbox(home, checkStatusTwo),


                ],
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(
                        left: 20.0, top: 5, bottom: 5),
                    child: Container(
                      child: DropdownButtonHideUnderline(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: DropdownButton<ExpensesCategoryModel>(
                              value: null,
                              iconEnabledColor: AppColors.color1,
                              hint: Text(showSelectedCategory, style: textStyleBigRegular,),
                              isExpanded: true,
                              onChanged: (newValue) {
                                setState(() {
                                  showSelectedCategory = newValue.description;
                                  selectedCategory = newValue.expense_type_id;
                                  RequestData.addExpenseRequestData['category'] = selectedCategory;
                                });
                              },
                              items: ResponseData.expensesCategoryList.map((option) {
                                return DropdownMenuItem<ExpensesCategoryModel>(
                                  value: option,
                                  child: Text(
                                    option.description.toString(),
                                    style: textStyleBigRegular,
                                  ),
                                );
                              }).toList()),
                        ),
                      ),
                    ),
                  ),),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formKey,
                  child:
                Column(
                  children: <Widget>[
                    ///amount field
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(amount, style: textStyleSmallSemiBold,),
                        ),
                      ],
                    ),
                    Card(
                        elevation: 5,
                        child: Padding(
                          padding:
                          const EdgeInsets.only(
                              left: 20.0, top: 5, bottom: 5),
                          child: formField(amountHint, RequestData.addExpenseRequestData, 'cost'),
                        ),),


//
//                    /// GST field
//                    Row(
//                      children: <Widget>[
//                        Padding(
//                          padding: const EdgeInsets.only(left:8.0),
//                          child: Text(gst, style: textStyleSmallSemiBold,),
//                        ),
//                      ],
//                    ),
//                    Card(
//                      elevation: 5,
//                      child: Padding(
//                        padding:
//                        const EdgeInsets.only(
//                            left: 20.0, top: 5, bottom: 5),
//                        child: formField(gstHint, RequestData.addExpenseRequestData, 'gst'),
//                      ),),



                    ///Company field
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(company, style: textStyleSmallSemiBold,),
                        ),
                      ],
                    ),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 20.0, top: 5, bottom: 5),
                        child: formField(companyHint, RequestData.addExpenseRequestData, 'company'),
                      ),),


                    ///Date field
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(date, style: textStyleSmallSemiBold,),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('${DateFormat.yMMMd().format(
                                      selectedDate)}',
                                      style: textStyleBigRegular),
                                ),
                                Icon(
                                  Icons.calendar_today,
                                  color: AppColors.color1,
                                ),
                              ],
                            ),
                          )),
                    ),



                    ///Description field
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(description, style: textStyleSmallSemiBold,),
                        ),
                      ],
                    ),
                    Card(
                      elevation: 5,
                      child: Padding(
                        padding:
                        const EdgeInsets.only(
                            left: 20.0, top: 5, bottom: 5),
                        child: descriptionField(descriptionHint, RequestData.addExpenseRequestData, 'description', controllerDescription),
                      ),),




                    ///Upload Pic Field
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Text(uploadReceipt, style: textStyleSmallSemiBold,),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        selectPic();
                      },
                      child: Card(
                        elevation: 5,
                        child: uploadPic(),
                      ),
                    ),



                  ],
                ),),
              ),

              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: MaterialButton(
                        height: 50,
                        onPressed: () async{
                          //print(controllerDescription.text);
                         submitAddExpense();
                        },
                        color: AppColors.color1,
                        child: Text(submit, style: textStyleSmallBoldWhite),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


//
//Future<void> saveForm(){
//    formKey.currentState.save();
//    return null;
//}

  Future<void> submitAddExpense() async {
    if (!formKey.currentState.validate()) {

    } else if(selectedBusiness == null){
      showAlertDialog(context, 'Pls choose a Business type');
    } else if(selectedCategory == null){
      showAlertDialog(context, 'Pls select category');
    } else if(dateGet == null){
      showAlertDialog(context, 'Pls Select date');
    } else if(controllerDescription.text.isEmpty){
        showAlertDialog(context, 'Pls enter description');
    } else if(file1 == null){
      showAlertDialog(context, 'Pls upload image');
    } else {
      formKey.currentState.save();
      loadingDialog(context);
      AddExpenseBackend().addExpenses(context, file1);

    }
  }





  Widget buildCheckbox(String title, bool boolValue) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: boolValue,
          onChanged: (bool value) {
            setState(() {
              switch (title) {
                case "Business":
                  checkStatusOne = value;
                  checkStatusTwo = false;
                  selectedBusiness = "Business";
                  RequestData.addExpenseRequestData['expclass'] = selectedBusiness;
                  break;
                case "Home":
                  checkStatusTwo = value;
                  checkStatusOne = false;
                  selectedBusiness = "Home";
                  RequestData.addExpenseRequestData['expclass'] = selectedBusiness;
                  break;

              }
            });
          },
          activeColor: AppColors.color1,
          checkColor: Colors.white,
        ),
        Text(
          title,
          style: textStyleSmalMedium,
        )
      ],
    );

  }

  uploadPic() {
    if(file1 == null){RequestData.addExpenseRequestData['picture'] = null;}
    return Container(
      height: 150,
      child: Center(
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: file1 == null ?
          Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Image.asset(
                assetImageUploadPicIcon, height: 50, width: 50,
              ),
              Text(uploadImageHint),

            ],
          )
              : Image.file(file1),
        ),
      ),
    );
  }

  void selectPic() {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Choose From '),
          content: Container(
            height: 70,
            child: Column(
              children: <Widget>[
                InkWell(
                  onTap: ()async{
                    Navigator.of(ctx).pop();
                    var picFile = await ImagePicker.pickImage(source: ImageSource.camera, imageQuality: 90, maxHeight: 2000, maxWidth: 2000);
                    setState(() {
                      file1 = picFile;

                      RequestData.addExpenseRequestData['picture'] = base64Encode(file1.readAsBytesSync());
                    });
                  },
                  child:  Container(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('Camera'),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),

                InkWell(
                  onTap: ()async{
                    Navigator.of(ctx).pop();
                    var picFile = await ImagePicker.pickImage(source: ImageSource.gallery, imageQuality: 90, maxHeight: 2000, maxWidth: 2000);
                    setState(() {
                      file1 = picFile;
                      RequestData.addExpenseRequestData['picture'] = base64Encode(file1.readAsBytesSync());
                    });
                  },
                  child: Container(
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text( 'Gallery'),
                      )),
                ),
              ],
            ),
          ),

          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ));
  }


  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData(primarySwatch: AppColors.color3,),
            child: child,
          );
        },
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2018, 1),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });

    dateGet= formatter.format(selectedDate);
    RequestData.addExpenseRequestData['mydate'] = dateGet;
  }
}
