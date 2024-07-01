import 'package:dio/dio.dart';
import 'package:hastype/data/dtos/cadastro_user_dto.dart';
import 'package:hastype/models/user_model.dart';

class UserRepository{
  final dio = Dio();

  Future<dynamic> postUser(CadastroUserDto model) async{
      Response response = await dio.post("http://192.168.15.200:8080/user/add", data: model.toJson());
      print(response.data);
      return UserModel.fromJson(response.data);
  }

  Future<Response<dynamic>> findByEmail(String email) async{
    return await dio.post("http://192.168.15.200:8080/user/byEmail/$email");
  }
}