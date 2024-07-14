import 'package:dio/dio.dart';
import 'package:hastype/data/repositories/user_repository.dart';

class HomeController{
  LogoutStates logoutState = LogoutStates.start;
  SuperLogoutStates superLogoutState = SuperLogoutStates.start;

  Future logoutUser(String? userId) async{
    
    logoutState = LogoutStates.loading;

    try{

      final response = await UserRepository().logoutUser(userId);

      logoutState = LogoutStates.logoutSucess;
      superLogoutState = SuperLogoutStates.sucess;

      return response.data;

    } on DioException catch(e){

      logoutState = LogoutStates.logoutFails;
      superLogoutState = SuperLogoutStates.error;

      if(e.type == DioExceptionType.connectionError){
        logoutState = LogoutStates.noInternet;
        return "Falha na conecção. Tente novamente!";
      }

      return e.response?.data;
      
    }


  }

}

enum LogoutStates {

  start,
  loading,
  logoutSucess,
  noInternet,
  logoutFails

}

enum SuperLogoutStates{

  start,
  sucess,
  error

}