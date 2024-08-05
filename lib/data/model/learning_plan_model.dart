class LearningPlanModel {
  List<Data>? data;
  bool? success;
  String? message;
  int? status;

  LearningPlanModel({this.data, this.success, this.message, this.status});

  LearningPlanModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  num? score;
  num? outOf;
  String? id;
  String? title;

  Data({this.score, this.outOf, this.id, this.title});

  Data.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    outOf = json['outOf'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    data['outOf'] = this.outOf;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}