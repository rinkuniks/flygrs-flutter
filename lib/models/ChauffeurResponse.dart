class ChauffeurListResponse {
  String? message;
  List<Data>? data;

  ChauffeurListResponse({this.message, this.data});

  ChauffeurListResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  String? userType;
  String? active;
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
        this.userType,
        this.active,
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
    userType = json['user_type'];
    active = json['active'];
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
    data['user_type'] = userType;
    data['active'] = active;
    if (this.userDetail != null) {
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
  Null? image;
  int? price;
  bool isSelected = false;

  UserDetail(
      {this.id,
        this.userId,
        this.gender,
        this.dob,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.price});

  UserDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    gender = json['gender'];
    dob = json['dob'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['gender'] = gender;
    data['dob'] = dob;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image'] = image;
    data['price'] = price;
    return data;
  }
}