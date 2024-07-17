import 'package:hastype/models/resposta_model.dart';

class FinishQuizDto {
  late List<RespostaModel> respostas;

  FinishQuizDto({required this.respostas});

  FinishQuizDto.fromJson(Map<String, dynamic> json) {
    respostas = <RespostaModel>[];
    json['respostas'].forEach((v) {
      respostas.add(new RespostaModel.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['respostas'] = this.respostas.map((v) => v.toJson()).toList();

    return data;
  }
}
