
class InvoiceLineItems{
    final String amount;
    final String balance;
    final String client_id;
    final String code;
    final String create_date;
    final String description;
    final String invoice_id;
    final String linetotal;
    final String notes;
    final String price;
    final String qty;
    final String refno;
    final Object signature;
    final String status;
    final String tax;
    final String taxchk;
    final String totaltax;
    final String tx_id;
    final String txline;
    final String unit;
    final String upload_date;

    InvoiceLineItems({this.amount, this.balance, this.client_id, this.code, this.create_date, this.description, this.invoice_id, this.linetotal, this.notes, this.price, this.qty, this.refno, this.signature, this.status, this.tax, this.taxchk, this.totaltax, this.tx_id, this.txline, this.unit, this.upload_date});

    factory InvoiceLineItems.fromJson(Map<String, dynamic> json) {
        return InvoiceLineItems(
            amount: json['amount'], 
            balance: json['balance'], 
            client_id: json['client_id'], 
            code: json['code'], 
            create_date: json['create_date'], 
            description: json['description'], 
            invoice_id: json['invoice_id'], 
            linetotal: json['linetotal'], 
            notes: json['notes'], 
            price: json['price'], 
            qty: json['qty'], 
            refno: json['refno'], 
            signature: json['signature'],
            status: json['status'], 
            tax: json['tax'], 
            taxchk: json['taxchk'], 
            totaltax: json['totaltax'], 
            tx_id: json['tx_id'], 
            txline: json['txline'], 
            unit: json['unit'], 
            upload_date: json['upload_date'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['amount'] = this.amount;
        data['balance'] = this.balance;
        data['client_id'] = this.client_id;
        data['code'] = this.code;
        data['create_date'] = this.create_date;
        data['description'] = this.description;
        data['invoice_id'] = this.invoice_id;
        data['linetotal'] = this.linetotal;
        data['notes'] = this.notes;
        data['price'] = this.price;
        data['qty'] = this.qty;
        data['refno'] = this.refno;
        data['status'] = this.status;
        data['tax'] = this.tax;
        data['taxchk'] = this.taxchk;
        data['totaltax'] = this.totaltax;
        data['tx_id'] = this.tx_id;
        data['txline'] = this.txline;
        data['unit'] = this.unit;
        data['upload_date'] = this.upload_date;
        if (this.signature != null) {
            data['signature'] = this.signature;
        }
        return data;
    }
}