
class DeleteExpenseModel {
    final String response_code;
    final String response_description;

    DeleteExpenseModel({this.response_code, this.response_description});

    factory DeleteExpenseModel.fromJson(Map<String, dynamic> json) {
        return DeleteExpenseModel(
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