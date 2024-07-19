import 'package:dio/dio.dart';
import 'package:hastype/data/dtos/finish_quiz_dto.dart';
import 'package:hastype/data/dtos/finish_quiz_response_dto.dart';
import 'package:hastype/data/dtos/start_quiz_response_dto.dart';
import 'package:hastype/data/repositories/urls.dart';

class QuizRepository{

  final dio = Dio();
  
  Future<StartQuizResponseDto> startQuiz(String sessionId) async{

    final response = await dio.post("${Urls().baseUrl}/quiz/start/$sessionId");

    return StartQuizResponseDto.fromJson(response.data);

  }

  Future<FinishQuizResponseDto> finishQuiz(String quizId, FinishQuizDto model) async{
    final response = await dio.put("${Urls().baseUrl}/quiz/finish/$quizId", data: model.toJson(), options: Options(contentType: 'application/json'));
    return FinishQuizResponseDto.fromJson(response.data);
  }

}