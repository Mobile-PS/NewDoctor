class Login_Model {
  Data? data;
  Meta? meta;

  Login_Model({this.data, this.meta});

  Login_Model.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    if (this.meta != null) {
      data['meta'] = this.meta?.toJson();
    }
    return data;
  }
}

class Data {
  String? email;
  String? name;
  String? token;

  Data({this.email, this.name, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['token'] = this.token;
    return data;
  }
}

class Meta {
  String? message;
  String? flag;
  int? statuscode;

  Meta({this.message, this.flag, this.statuscode});

  Meta.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    flag = json['flag'];
    statuscode = json['statuscode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['flag'] = this.flag;
    data['statuscode'] = this.statuscode;
    return data;
  }
}