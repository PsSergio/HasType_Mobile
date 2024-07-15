import 'package:dio/dio.dart';

class SessionRepository{
  final dio = Dio();

  Future<Response> validarSessao(String sessionId) async{

    return await dio.post("http://192.168.15.200:8080/sessao/validar/$sessionId");

  }
  
}