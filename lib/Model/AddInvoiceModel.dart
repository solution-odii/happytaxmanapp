
class AddInvoiceModel {
    final String amount;
    final String notes;
    final String refno;
    final String response_code;
    final String response_description;
    final String tax;

    AddInvoiceModel({this.amount, this.notes, this.refno, this.response_code, this.response_description, this.tax});

    factory AddInvoiceModel.fromJson(Map<String, dynamic> json) {
        return AddInvoiceModel(
            amount: json['amount'], 
            notes: json['notes'], 
            refno: json['refno'], 
            response_code: json['response_code'], 
            response_description: json['response_description'], 
            tax: json['tax'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['amount'] = this.amount;
        data['notes'] = this.notes;
        data['refno'] = this.refno;
        data['response_code'] = this.response_code;
        data['response_description'] = this.response_description;
        data['tax'] = this.tax;
        return data;
    }
}