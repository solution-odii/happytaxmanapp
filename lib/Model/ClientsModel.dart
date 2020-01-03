
class ClientsModel {
    final String account_id;
    final String address;
    final String billrate;
    final String city;
    final String client_id;
    final String client_name;
    final String country;
    final String create_date;
    final String email;
    final String phone;
    final String province;

    ClientsModel({this.account_id, this.address, this.billrate, this.city, this.client_id, this.client_name, this.country, this.create_date, this.email, this.phone, this.province});

    factory ClientsModel.fromJson(Map<String, dynamic> json) {
        return ClientsModel(
            account_id: json['account_id'], 
            address: json['address'], 
            billrate: json['billrate'], 
            city: json['city'], 
            client_id: json['client_id'], 
            client_name: json['client_name'], 
            country: json['country'], 
            create_date: json['create_date'], 
            email: json['email'], 
            phone: json['phone'], 
            province: json['province'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['account_id'] = this.account_id;
        data['address'] = this.address;
        data['billrate'] = this.billrate;
        data['city'] = this.city;
        data['client_id'] = this.client_id;
        data['client_name'] = this.client_name;
        data['country'] = this.country;
        data['create_date'] = this.create_date;
        data['email'] = this.email;
        data['phone'] = this.phone;
        data['province'] = this.province;
        return data;
    }
}