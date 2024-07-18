class RankingTempoModel {
  late String userName;
  late int tempo;

  RankingTempoModel({required this.userName,required this.tempo});

  RankingTempoModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    tempo = json['tempo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['tempo'] = this.tempo;
    return data;
  }
}