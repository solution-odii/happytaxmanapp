class ExpensesHistoryModel {
    final String classType;
    final String receiver;
    final String account_id;
    final Object comments;
    final String cost;
    final String date_submited;
    final String description;
    final String expense_type_id;
    final String expenses_id;
    final String gst;
    final String picture;

    ExpensesHistoryModel({this.classType, this.receiver, this.account_id, this.comments, this.cost, this.date_submited, this.description, this.expense_type_id, this.expenses_id, this.gst, this.picture});

    factory ExpensesHistoryModel.fromJson(Map<String, dynamic> json) {
        return ExpensesHistoryModel(
            classType: json['class'],
            receiver: json['receiver'],
            account_id: json['account_id'], 
            comments: json['comments'],
            cost: json['cost'], 
            date_submited: json['date_submited'], 
            description: json['description'], 
            expense_type_id: json['expense_type_id'], 
            expenses_id: json['expenses_id'], 
            gst: json['gst'], 
            picture: json['picture'], 
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
        data['expenses_id'] = this.expenses_id;
        data['gst'] = this.gst;
        data['picture'] = this.picture;
        if (this.comments != null) {
            data['comments'] = this.comments;
        }
        return data;
    }
}