import 'InvoiceLineItems.dart';

class InvoiceDetailsModel {
    final String client_id;
    final String client_name;
    final String comments;
    final Contacts contacts;
    final List<InvoiceLineItems> lineitems;
    final String scode;

    InvoiceDetailsModel({this.client_id, this.client_name, this.comments, this.contacts, this.lineitems, this.scode});

    factory InvoiceDetailsModel.fromJson(Map<String, dynamic> json) {
        return InvoiceDetailsModel(
            client_id: json['client_id'], 
            client_name: json['client_name'], 
            comments: json['comments'], 
            contacts: json['contacts'] != null ? Contacts.fromJson(json['contacts']) : null, 
            lineitems: json['lineitems'] != null ? (json['lineitems'] as List).map((i) => InvoiceLineItems.fromJson(i)).toList() : null,
            scode: json['scode'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['client_id'] = this.client_id;
        data['client_name'] = this.client_name;
        data['comments'] = this.comments;
        data['scode'] = this.scode;
        if (this.contacts != null) {
            data['contacts'] = this.contacts.toJson();
        }
        if (this.lineitems != null) {
            data['lineitems'] = this.lineitems.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Contacts {
    final String response_code;
    final String response_description;

    Contacts({this.response_code, this.response_description});

    factory Contacts.fromJson(Map<String, dynamic> json) {
        return Contacts(
            response_code: json['response_code'],
            response_description: json['response_description'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['response_code'] = this.response_code;
        data['response_description'] = this.response_description;
        return data;
    }
}