class SessionModel {
    final String id;
    final String userId;

    SessionModel({
        required this.id,
        required this.userId,
    });

    SessionModel.fromJson(Map<String, dynamic> json):
        id = json["id"],
        userId = json["userId"];


    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
    };
}