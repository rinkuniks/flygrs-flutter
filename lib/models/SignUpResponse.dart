class SignUpResponse {
  SignUpResponse({
    this.message,
    this.data,});

  SignUpResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// token : "5|WtpAjqKMS8USgI3l5MLMmQunnqSv26yPAYSfmmx9d75e6109"
/// name : "Kishore"

class Data {
  Data({
    this.token,
    this.name,});

  Data.fromJson(dynamic json) {
    token = json['token'];
    name = json['name'];
  }
  String? token;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    map['name'] = name;
    return map;
  }

}