class UpdateExpenseModel {
    final String classType;
    final String receiver;
    final String account_id;
    final String cost;
    final String date_submited;
    final String description;
    final String expense_type_id;
    final double gst;
    final String response_code;
    final String response_description;

    UpdateExpenseModel({this.classType, this.receiver, this.account_id, this.cost, this.date_submited, this.description, this.expense_type_id, this.gst, this.response_code, this.response_description});

    factory UpdateExpenseModel.fromJson(Map<String, dynamic> json) {
        return UpdateExpenseModel(
            classType: json['class'],
            receiver: json['receiver'],
            account_id: json['account_id'], 
            cost: json['cost'], 
            date_submited: json['date_submited'], 
            description: json['description'], 
            expense_type_id: json['expense_type_id'], 
            gst: json['gst'], 
            response_code: json['response_code'], 
            response_description: json['response_description'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['class'] = this.classType;
        data['receiver'] = this.receiver;
        data['account_id'] = this.account_id;
        data['cost'] = this.cost;
        data['date_submited'] = this.date_submited;
        data['description'] = this.description;
        data['expense_type_id'] = this.expense_type_id;
        data['gst'] = this.gst;
        data['response_code'] = this.response_code;
        data['response_description'] = this.response_description;
        return data;
    }
}