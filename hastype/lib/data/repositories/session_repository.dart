import 'package:dio/dio.dart';
import 'package:hastype/data/repositories/urls.dart';

class SessionRepository{
  final dio = Dio();

  Future<Response> validarSessao(String sessionId) async{

    return await dio.post("${Urls().baseUrl}/sessao/validar/$sessionId");

  }
  
}