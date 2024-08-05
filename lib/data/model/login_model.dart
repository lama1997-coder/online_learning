class LoginModel {
  List<String>? data;
  bool? success;
  String? message;
  int? status;

  LoginModel({this.data, this.success, this.message, this.status});

  LoginModel.fromJson(Map<String, dynamic> json) {
    data = json['data'].cast<String>();
    success = json['success'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['success'] = this.success;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
