import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Utils/Styles.dart';

formField(String hint, Map<String, String> data, String dataItem ) {
  return TextFormField(
    enabled: true,
    keyboardType: TextInputType.text,
    cursorColor: Colors.black,
    style: textStyleBigRegular,
    validator: (value) {
      if (value.isEmpty) {
        return formErrorText;
      }
      return null;
    },
    onSaved: (value) {
      data['$dataItem'] = value;
    },
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 15.0),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none),
  );
}




descriptionField(String hint, Map<String, String> data, String dataItem, TextEditingController textEditingController) {
  return Container(
    height: 200.0,
    child: TextField(
      onChanged: (value){
        data['$dataItem'] = value;
      },
     controller: textEditingController,
      cursorColor: Colors.black,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: textStyleBigRegular,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0.0, 15.0, 20.0, 15.0),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none),
    ),

  );
}


