import 'package:dio/dio.dart';
import 'package:hastype/data/dtos/start_quiz_response_dto.dart';

class QuizRepository{

  final dio = Dio();
  
  Future<StartQuizResponseDto> startQuiz(String sessionId) async{

    final response = await dio.post("http://192.168.15.200:8080/quiz/start/$sessionId");

    return StartQuizResponseDto.fromJson(response.data);

  }

}