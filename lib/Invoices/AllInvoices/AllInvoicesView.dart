import 'package:flutter/material.dart';
import 'package:happy_tax_man/Constants/AppColors.dart';
import 'package:happy_tax_man/Utils/Navigators.dart';

import 'AllInvoicesAppBarDesign.dart';
import 'FilteredInvoicesStream.dart';

class AllInvoicesView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: AppBar(

          brightness: Brightness.dark,
          backgroundColor: AppColors.color5,
          leading: InkWell(
            onTap: (){
              navigateBack(context);
            },
            child: Icon (Icons.arrow_back, color: Colors.white,),
          ),
          flexibleSpace: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),

              AllInvoicesAppBarDesign()
            ],
          ),
        ),
      ),

      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FilteredInvoicesStream(clientId: "", invoiceNum: ""),
          ),

        ],

      ),
    );
  }



}



