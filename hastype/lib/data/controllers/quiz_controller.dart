import 'package:dio/dio.dart';
import 'package:hastype/data/dtos/finish_quiz_dto.dart';
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

 Future finishQuiz(String quizId, FinishQuizDto model) async{
  
  try{
    final response = await QuizRepository().finishQuiz(quizId, model);
    return response;
  }on DioException catch(e){
    return e.response?.data;
  }

 }

}