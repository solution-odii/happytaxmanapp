

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Expenses/AddExpense/AddExpensePage.dart';
import 'package:happy_tax_man/Invoices/AddInvoice/AddInvoicePage.dart';
import 'package:happy_tax_man/Invoices/AllInvoices/AllInvoicesView.dart';

class MenuModel {
  final IconData icon;
  final String title;
  final Widget widget;
  final Color color;



  MenuModel(
      {this.icon,
        this.title,
        this.widget,
        this.color
      });
}

final List<MenuModel> menuList = [

  MenuModel(
      icon: FontAwesomeIcons.coins,
      title:  addExpense,
      widget: AddExpensePage(),
      color: AppColors.designColor8
  ),

  MenuModel(
      icon: FontAwesomeIcons.receipt,
      title:  addInvoices,
      widget: AddInvoicePage(),
      color: AppColors.designColor5

  ),

  MenuModel(
      icon: FontAwesomeIcons.wpforms,
      title:  addClient,
      widget: AddExpensePage(),
      color: AppColors.designColor7

  ),

  MenuModel(
      icon: FontAwesomeIcons.amazonPay,
      title:  addPaymentInfo,
      widget: AddExpensePage(),
      color: Colors.blue.shade400

  ),

  MenuModel(
      icon: FontAwesomeIcons.calendarCheck,
      title:  createEstimate,
      widget: AddExpensePage(),
      color: Colors.deepPurple.shade200

  ),

  MenuModel(
      icon: FontAwesomeIcons.search,
      title:  searchInvoices,
      widget: AllInvoicesView(),
      color: AppColors.color2

  ),




];