class ProfileResponse {
  String? message;
  Data? data;

  ProfileResponse({this.message, this.data});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  Null? emailVerifiedAt;
  int? phone;
  int? isAdmin;
  String? createdAt;
  String? updatedAt;
  UserDetail? userDetail;

  Data(
      {this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.phone,
        this.isAdmin,
        this.createdAt,
        this.updatedAt,
        this.userDetail});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    phone = json['phone'];
    isAdmin = json['is_admin'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userDetail = json['user_detail'] != null
        ? UserDetail.fromJson(json['user_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone'] = phone;
    data['is_admin'] = isAdmin;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (userDetail != null) {
      data['user_detail'] = userDetail!.toJson();
    }
    return data;
  }
}

class UserDetail {
  int? id;
  int? userId;
  String? gender;
  Null? dob;
  String? createdAt;
  String? updatedAt;

  UserDetail(
      {this.id,
        this.userId,
        this.gender,
        this.dob,
        this.createdAt,
        this.updatedAt});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    gender = json['gender'];
    dob = json['dob'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
