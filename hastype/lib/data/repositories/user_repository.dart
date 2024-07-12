import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hastype/data/dtos/cadastro_user_dto.dart';
import 'package:hastype/data/dtos/login_user_dto.dart';
import 'package:hastype/models/session_model.dart';
import 'package:hastype/models/user_model.dart';

class UserRepository{
  final dio = Dio();

  Future<dynamic> singupUser(CadastroUserDto model) async{
      Response response = await dio.post("http://192.168.15.200:8080/user/singup", data: model.toJson());
      return UserModel.fromJson(response.data);
  }

  Future<Response<dynamic>> findByEmail(String email) async{
    return await dio.post("http://192.168.15.200:8080/user/byEmail/$email");
  }

  Future<dynamic> singinUser(LoginUserDto model) async{
    Response response = await dio.post("http://192.168.15.200:8080/user/singin", data: model.toJson());
    return SessionModel.fromJson(response.data);
    // needs to fix this return

  }
}