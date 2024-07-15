import 'package:dio/dio.dart';
import 'package:hastype/data/repositories/quiz_repository.dart';

class QuizController{

  Future startQuiz(String sessionId) async{

    try{
      final response = await QuizRepository().startQuiz(sessionId);
      return response;
    }on DioException catch(e){
      return e.response?.data;
    }

  }

}