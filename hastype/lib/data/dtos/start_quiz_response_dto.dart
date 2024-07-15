import 'package:hastype/models/palavra_model.dart';
import 'package:hastype/models/quiz_model.dart';

class StartQuizResponseDto {
  late QuizModel quiz;
  late List<PalavrasModel> palavras;

  StartQuizResponseDto({required this.quiz, required this.palavras});

  StartQuizResponseDto.fromJson(Map<String, dynamic> json) {
    quiz = QuizModel.fromJson(json['quiz']);
    palavras = <PalavrasModel>[];
    json['palavras'].forEach((v) {
      palavras.add(PalavrasModel.fromJson(v));
    });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quiz'] = this.quiz.toJson();
    data['palavras'] = this.palavras.map((v) => v.toJson()).toList();
    return data;
  }
}
