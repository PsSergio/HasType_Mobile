class RankingPontuacaoModel {
  late String userName;
  late int pontuacao;

  RankingPontuacaoModel({required this.userName,required this.pontuacao});

  RankingPontuacaoModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    pontuacao = json['pontuacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['tempo'] = this.pontuacao;
    return data;
  }
}