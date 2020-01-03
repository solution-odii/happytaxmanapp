class ExpensesCategoryModel {
    final String description;
    final String expense_type_id;

    ExpensesCategoryModel({this.description, this.expense_type_id});

    factory ExpensesCategoryModel.fromJson(Map<String, dynamic> json) {
        return ExpensesCategoryModel(
            description: json['description'], 
            expense_type_id: json['expense_type_id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['expense_type_id'] = this.expense_type_id;
        return data;
    }
}