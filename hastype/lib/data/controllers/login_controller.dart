import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hastype/data/dtos/login_user_dto.dart';
import 'package:hastype/data/repositories/user_repository.dart';

class LoginController {
  LoginStates state = LoginStates.start;

  Future start(LoginUserDto model) async {
    state = LoginStates.loading;

    try {
      final response = await UserRepository().singinUser(model);

      print(response);

      state = LoginStates.logged;

      return response;
    } on DioException catch (e) {
      if (e.response?.statusCode == 200) {
        state = LoginStates.userAlreadyLogged;
        return e.response?.data;
      } else if (e.response?.statusCode == 404) {
        state = LoginStates.dataInvalid;
        return e.response?.data;
      } else if (e.type == DioExceptionType.connectionError) {
        state = LoginStates.noInternet;
        return "Falha na conecção. Tente novamente!";
      }
    }
  }
}

enum LoginStates {
  start,
  loading,
  logged,
  noInternet,
  dataInvalid,
  userAlreadyLogged,
}
