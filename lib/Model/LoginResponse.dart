class LoginResponse {
    final String account_id;
    final String bizaddress;
    final String bizphone;
    final String businessname;
    final String email;
    final String firstname;
    final String last_name;
    final bool logged_in;
    final String user_type;
    final String userbusinessinfo;
    final String username;

    LoginResponse({this.account_id, this.bizaddress, this.bizphone, this.businessname, this.email, this.firstname, this.last_name, this.logged_in, this.user_type, this.userbusinessinfo, this.username});

    factory LoginResponse.fromJson(Map<String, dynamic> json) {
        return LoginResponse(
            account_id: json['account_id'],
            bizaddress: json['bizaddress'],
            bizphone: json['bizphone'],
            businessname: json['businessname'],
            email: json['email'],
            firstname: json['firstname'],
            last_name: json['last_name'],
            logged_in: json['logged_in'],
            user_type: json['user_type'],
            userbusinessinfo: json['userbusinessinfo'],
            username: json['username'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['account_id'] = this.account_id;
        data['bizaddress'] = this.bizaddress;
        data['bizphone'] = this.bizphone;
        data['businessname'] = this.businessname;
        data['email'] = this.email;
        data['firstname'] = this.firstname;
        data['last_name'] = this.last_name;
        data['logged_in'] = this.logged_in;
        data['user_type'] = this.user_type;
        data['userbusinessinfo'] = this.userbusinessinfo;
        data['username'] = this.username;
        return data;
    }
}