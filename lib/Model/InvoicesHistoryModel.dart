
class InvoicesHistoryModel {
    final String account_id;
    final String amount;
    final String amount_paid;
    final String client_id;
    final String client_name;
    final String code;
    final String create_date;
    final String invoice_id;
    final String notes;
    final String refno;
    final String scode;
    final Object sent_date;
    final Object signature;
    final String status;
    final String tax;

    InvoicesHistoryModel({this.account_id, this.amount, this.amount_paid, this.client_id, this.client_name, this.code, this.create_date, this.invoice_id, this.notes, this.refno, this.scode, this.sent_date, this.signature, this.status, this.tax});

    factory InvoicesHistoryModel.fromJson(Map<String, dynamic> json) {
        return InvoicesHistoryModel(
            account_id: json['account_id'], 
            amount: json['amount'], 
            amount_paid: json['amount_paid'], 
            client_id: json['client_id'], 
            client_name: json['client_name'], 
            code: json['code'], 
            create_date: json['create_date'], 
            invoice_id: json['invoice_id'], 
            notes: json['notes'], 
            refno: json['refno'], 
            scode: json['scode'], 
            sent_date: json['sent_date'],
            signature: json['signature'],
            status: json['status'], 
            tax: json['tax'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['account_id'] = this.account_id;
        data['amount'] = this.amount;
        data['amount_paid'] = this.amount_paid;
        data['client_id'] = this.client_id;
        data['client_name'] = this.client_name;
        data['code'] = this.code;
        data['create_date'] = this.create_date;
        data['invoice_id'] = this.invoice_id;
        data['notes'] = this.notes;
        data['refno'] = this.refno;
        data['scode'] = this.scode;
        data['status'] = this.status;
        data['tax'] = this.tax;
        if (this.sent_date != null) {
            data['sent_date'] = this.sent_date;
        }
        if (this.signature != null) {
            data['signature'] = this.signature;
        }
        return data;
    }
}