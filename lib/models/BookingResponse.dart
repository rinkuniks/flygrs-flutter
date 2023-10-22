class BookingResponse {
  String? message;
  Data? data;

  BookingResponse({this.message, this.data});

  BookingResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? driverId;

  Data({this.id, this.driverId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driverId = json['driver_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['driver_id'] = driverId;
    return data;
  }
}