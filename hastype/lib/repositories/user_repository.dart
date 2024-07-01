import 'package:dio/dio.dart';

class UserRepository{
  final dio = Dio();

  Future<Response<dynamic>> postUser(String nome, String email, String senha) async{
    final response = await dio.post("http://192.168.15.200:8080/user/add", data: {'nome': nome, 'email': email, 'senha': senha});
    return response;
  }
  
}