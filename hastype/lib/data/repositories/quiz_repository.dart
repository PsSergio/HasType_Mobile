import 'package:dio/dio.dart';
import 'package:hastype/data/dtos/finish_quiz_dto.dart';
import 'package:hastype/data/dtos/finish_quiz_response_dto.dart';
import 'package:hastype/data/dtos/start_quiz_response_dto.dart';

class QuizRepository{

  final dio = Dio();
  
  Future<StartQuizResponseDto> startQuiz(String sessionId) async{

    final response = await dio.post("http://192.168.15.200:8080/quiz/start/$sessionId");

    return StartQuizResponseDto.fromJson(response.data);

  }

  Future<FinishQuizResponseDto> finishQuiz(String quizId, FinishQuizDto model) async{
    final response = await dio.put("http://192.168.15.200:8080/quiz/finish/$quizId", data: model.toJson(), options: Options(contentType: 'application/json'));
    return FinishQuizResponseDto.fromJson(response.data);
  }

}