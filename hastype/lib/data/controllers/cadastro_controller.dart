import 'package:dio/dio.dart';
import 'package:hastype/data/dtos/cadastro_user_dto.dart';
import 'package:hastype/data/repositories/user_repository.dart';
import 'package:hastype/models/user_model.dart';

class CadastroController{

  CadastroStatus state = CadastroStatus.start;
  
  Future start(CadastroUserDto model) async{
    state = CadastroStatus.loading;
    
    try{
      Response response = await UserRepository().postUser(model);
      
      if(response.statusCode == 200){
        state = CadastroStatus.created;
        return UserModel.fromJson(response.data);
      }
      
    }on DioException catch(e){
      if(e.type == DioExceptionType.badResponse){
        state = CadastroStatus.emailExists;
        return e.response?.data;
      }else if(e.type == DioExceptionType.connectionError){
        state = CadastroStatus.noInternet;
        return "Falha na conecção. Tente novamente!";
      }

    }

  }


}

enum CadastroStatus{

  start,
  created, 
  emailExists,
  noInternet,
  loading,

}