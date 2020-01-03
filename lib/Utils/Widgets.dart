import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/Strings.dart';

import 'Styles.dart';

formFieldOne(String hint, Map<String, String> data, String dataItem ) {
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


formFieldTwo(String hint, TextEditingController controller ) {
  return TextFormField(
    enabled: true,
    keyboardType: TextInputType.text,
    cursorColor: Colors.black,
    style: textStyleBigRegular,
    controller: controller,
    validator: (value) {
      if (value.isEmpty) {
        return formErrorText;
      }
      return null;
    },
    onSaved: (value) {

    },
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.black),
        border: InputBorder.none),
  );
}