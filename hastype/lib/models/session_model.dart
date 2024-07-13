class SessionModel {
  String? id;
  String? userId;

  SessionModel({this.id, this.userId});

  SessionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    return data;
  }
}