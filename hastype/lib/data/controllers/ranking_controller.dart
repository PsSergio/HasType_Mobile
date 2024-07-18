import 'package:dio/dio.dart';
import 'package:hastype/data/repositories/ranking_repository.dart';
import 'package:hastype/models/ranking_tempo_model.dart';

class RankingController{

  RankingStates state = RankingStates.start;

  Future showRankingTempo() async{
    state = RankingStates.loading;
    try{

    final response = await RankingRepository().getRankingTempo();

    state = RankingStates.sucess;

    return response;

    }on DioException catch(e){
      state = RankingStates.error;
      if(e.type == DioExceptionType.connectionError){
        return "Falha na conecção. Tente novamente!";
      }else{
        return e.response?.data;
      }
    }
  }

  Future showRankingPontuacao() async{
    state = RankingStates.loading;
    try{

    final response = await RankingRepository().getRankingPontuacao();

    state = RankingStates.sucess;

    return response;

    }on DioException catch(e){
      state = RankingStates.error;
      if(e.type == DioExceptionType.connectionError){
        return "Falha na conecção. Tente novamente!";
      }else{
        return e.response?.data;
      }
    }
  }

}

enum RankingStates{
  start,
  loading,
  sucess,
  error
}