import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hastype/data/dtos/login_user_dto.dart';
import 'package:hastype/data/repositories/user_repository.dart';

class LoginController {
  LoginStates state = LoginStates.start;
  SuperLoginStates superState = SuperLoginStates.start;


  Future<dynamic> start(LoginUserDto model) async {
    state = LoginStates.loading;

    try{
      
      final response = await UserRepository().singinUser(model);

      state = LoginStates.logged;
      superState = SuperLoginStates.sucess;

      return response;

    } on DioException catch (e) {      

      superState = SuperLoginStates.error;

      if (e.response?.statusCode == 401) {
        state = LoginStates.userAlreadyLogged;
        return e.response?.data;
      } else if (e.response?.statusCode == 404) {
        state = LoginStates.dataInvalid;
        return e.response?.data;
      } else if ( e.type == DioExceptionType.connectionError) {
        state = LoginStates.noInternet;
        return "Falha na conecção. Tente novamente!";
      }

    }
  }
}

enum SuperLoginStates{
  start,
  sucess, 
  error
}

enum LoginStates {
  start,
  loading,
  logged,
  noInternet,
  dataInvalid,
  userAlreadyLogged,
}
