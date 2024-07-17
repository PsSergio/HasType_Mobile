class RespostaModel {
  late int palavraId;
  late String resposta;

  RespostaModel({required this.palavraId, required this.resposta});

  RespostaModel.fromJson(Map<String, dynamic> json) {
    palavraId = json['palavraId'];
    resposta = json['resposta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['palavraId'] = this.palavraId;
    data['resposta'] = this.resposta;
    return data;
  }
}