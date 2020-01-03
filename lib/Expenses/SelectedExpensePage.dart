
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:happy_tax_man/Backend/DeleteExpenseBackend.dart';
import 'package:happy_tax_man/Backend/UpdateExpenseBackend.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Data/RequestData.dart';
import 'package:happy_tax_man/Data/ResponseData.dart';
import 'package:happy_tax_man/Model/ExpensesCategoryModel.dart';
import 'package:happy_tax_man/Utils/AlertDialogs.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';
import 'package:happy_tax_man/Utils/Styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';

class SelectedExpense extends StatefulWidget {
  final String id;
  final String imageURL;
  final String cost;
  final String expenseClass;
  final String descriptionEntered;
  final String companyReceiver;
  final String dateSubmitted;
  final String expenseCategory;

  SelectedExpense({this.id, this.imageURL, this.cost, this.expenseClass, this.descriptionEntered,
      this.companyReceiver, this.dateSubmitted, this.expenseCategory});

  @override
  _SelectedExpenseState createState() => _SelectedExpenseState();
}

class _SelectedExpenseState extends State<SelectedExpense> {
  bool isEnabled = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  File file1;
  bool checkStatusOne = false;
  bool checkStatusTwo = false;
  bool pictureStatusOne = true;
  String selectedCategory;
  String selectedBusiness;
  String showSelectedCategory = categoryHintText;

  @override
  void initState() {
    // TODO: implement initState
    updateCheckBoxes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("View Expense"),
        backgroundColor: AppColors.color5,
        elevation: 0,
      ),

      body:  ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.5, 0.9],
                    colors: [
                      AppColors.color5,
                      Colors.purple.shade200
                    ]
                )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Visibility(
                      visible: pictureStatusOne,
                      child: InkWell(
                        onTap: ()=> showImageDialog(context, widget.imageURL),
                        child: CircleAvatar(
                          minRadius: 60,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: AppColors.color1,
                            backgroundImage: NetworkImage(widget.imageURL),
                            minRadius: 50,
                          ),
                        ),
                      ),
                    ),

                    Visibility(
                      visible: isEnabled,
                      child: InkWell(
                        onTap: ()=> selectPic(),
                        child: CircleAvatar(
                          minRadius: 60,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            backgroundColor: AppColors.color1,
                            minRadius: 50,
                            child: uploadPic(),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(typeOfBusinessHintText, style: textStyleBigBoldWhite,),

                    buildCheckbox(business, checkStatusOne),
                    buildCheckbox(home, checkStatusTwo),


                  ],
                ),
              ],
            ),
          ),


          Visibility(
            visible: isEnabled,
            child: Padding(
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
                                RequestData.updateExpenseRequestData["category"] = selectedCategory;

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
                      child: detailsField(widget.cost, RequestData.updateExpenseRequestData, "amount", isEnabled),
                    ),),




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
                      child: detailsField(widget.companyReceiver, RequestData.updateExpenseRequestData, "company", isEnabled),
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
                  Card(
                    elevation: 5,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(
                          left: 20.0, top: 5, bottom: 5),
                      child: detailsField(widget.dateSubmitted, RequestData.updateExpenseRequestData, "mydate", isEnabled),
                    ),),




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
                      child: detailsField(widget.descriptionEntered, RequestData.updateExpenseRequestData, "description", isEnabled),
                    ),),



                ],
              ),),



          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              ///Edit Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text(edit),
                  textColor: Colors.white,
                  color: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(40)),
                  ),
                  onPressed: () {
                    setState(() {
                      isEnabled = true;
                      pictureStatusOne = false;
                      checkStatusOne = false;
                      checkStatusTwo = false;
                    });
                  },
                ),
              ),

              ///Delete button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text(delete),
                  textColor: Colors.white,
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                        Radius.circular(40)),
                  ),
                  onPressed: () {
                    deleteExpense();
                  },
                ),
              ),


            ///Update Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: isEnabled,
                  child: RaisedButton(
                    child: Text(update),
                    textColor: Colors.white,
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(40)),
                    ),
                    onPressed: () {
                   //  formKey.currentState.save();
//                  print(RequestData.updateExpenseRequestData["mydate"]);
                    //  print(selectedCategory);
                      updateExpense();

                    },
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  deleteExpense(){
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Notification'),
          content: Text("Are you sure you want to delete expense?"),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                navigateBack(context);

              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                loadingDialog(context);
                DeleteExpenseBackend().deleteExpenses(context, widget.id);
              },
            )
          ],
        ));
  }






  Future<void> updateExpense() async {
   if(selectedBusiness == null){
      RequestData.updateExpenseRequestData["expclass"] = widget.expenseClass;
    } if(selectedCategory == null){
      RequestData.updateExpenseRequestData["category"] = widget.expenseCategory;
    }  if(file1 == null){
      formKey.currentState.save();
        loadingDialog(context);
       await UpdateExpenseBackend().updateExpenseWithoutImage(context, widget.id);


    } else {
      formKey.currentState.save();
      loadingDialog(context);
      UpdateExpenseBackend().updateExpenseWithImage(context, file1, widget.id);

    }
  }


  detailsField(String value, Map<String, String> data, String dataItem, bool isEnabled ) {
    return TextFormField(
      enabled: isEnabled,
      keyboardType: TextInputType.text,
      cursorColor: Colors.black,
      style: textStyleBigRegular,
      initialValue: value,
//      validator: (value) {
//        if (value.isEmpty) {
//          return formErrorText;
//        }
//        return null;
//      },
      onSaved: (newValue) {
        if(newValue!=null){
          data['$dataItem'] = newValue.trim();
        }else
        data['$dataItem'] = value.trim();
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 15.0),
          border: InputBorder.none),
    );
  }



  updateCheckBoxes(){
    if(widget.expenseClass.contains("Business")){
      setState(() {
        checkStatusOne = true;
      });
    }else if(widget.expenseClass.contains("Home")){
      setState(() {
        checkStatusTwo = true;
      });
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
                  RequestData.updateExpenseRequestData["expclass"] = selectedBusiness;
                  break;
                case "Home":
                  checkStatusTwo = value;
                  checkStatusOne = false;
                  selectedBusiness = "Home";
                  RequestData.updateExpenseRequestData["expclass"] = selectedBusiness;
                  break;

              }
            });
          },
          activeColor: AppColors.color1,
          checkColor: Colors.white,
        ),
        Text(
          title,
          style: textStyleSmallBoldWhite,
        )
      ],
    );

  }



  uploadPic() {
    if(file1 == null){RequestData.addExpenseRequestData['picture'] = null;}
    return Container(
      height: 70,
      child: Center(
        child:
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: file1 == null ?
          Text(updateImageHint, style: textStyleSmallBoldWhite,)
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
                      ),),
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


}




