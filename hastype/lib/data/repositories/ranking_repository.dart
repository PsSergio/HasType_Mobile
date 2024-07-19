import 'package:dio/dio.dart';
import 'package:hastype/data/repositories/urls.dart';
import 'package:hastype/models/ranking_pontuacao_model.dart';
import 'package:hastype/models/ranking_tempo_model.dart';

class RankingRepository{
  final dio = Dio();

  Future getRankingTempo() async{
    final response = await dio.get("${Urls().baseUrl}/ranking/tempo/all");
    final list = response.data as List;
    return list.map((response) => RankingTempoModel.fromJson(response)).toList();
  }

  Future getRankingPontuacao() async{
    final response = await dio.get("${Urls().baseUrl}/ranking/pontuacao/all");
    final list = response.data as List;
    return list.map((response) => RankingPontuacaoModel.fromJson(response)).toList();
  }
}