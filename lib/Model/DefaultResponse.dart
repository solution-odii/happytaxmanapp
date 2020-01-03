class DefaultResponse {
    final Object resdata;

    DefaultResponse({this.resdata});

    factory DefaultResponse.fromJson(Map<String, dynamic> json) {
        return DefaultResponse(
            resdata: json['resdata'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if (this.resdata != null) {
            data['resdata'] = this.resdata;
        }
        return data;
    }
}

