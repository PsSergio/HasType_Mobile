import 'package:dio/dio.dart';
import 'package:hastype/data/dtos/cadastro_user_dto.dart';

class UserRepository{
  final dio = Dio();

  Future<Response<dynamic>> postUser(CadastroUserDto model) async{
    return await dio.post("http://192.168.15.200:8080/user/add", data: model.toJson());
  }
}