

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:happy_tax_man/Constants/Strings.dart';
import 'package:happy_tax_man/Expenses/AddExpense/AddExpensePage.dart';
import 'package:happy_tax_man/Invoices/AddInvoice/AddInvoicePage.dart';
import 'package:happy_tax_man/Invoices/AllInvoices/AllInvoicesView.dart';

class MenuModel {
  final IconData icon;
  final String title;
  final Widget widget;



  MenuModel(
      {this.icon,
        this.title,
        this.widget
        });
}

final List<MenuModel> menuList = [

  MenuModel(
    icon: FontAwesomeIcons.coins,
    title:  addExpense,
    widget: AddExpensePage()
  ),

  MenuModel(
      icon: FontAwesomeIcons.receipt,
      title:  addInvoices,
      widget: AddInvoicePage()

  ),

  MenuModel(
      icon: FontAwesomeIcons.wpforms,
      title:  addClient,
      widget: AddExpensePage()

  ),

  MenuModel(
      icon: FontAwesomeIcons.amazonPay,
      title:  addPaymentInfo,
      widget: AddExpensePage()

  ),

  MenuModel(
      icon: FontAwesomeIcons.search,
      title:  searchInvoices,
      widget: AllInvoicesView()

  ),




];