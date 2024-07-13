import 'package:dio/dio.dart';
import 'package:hastype/data/dtos/cadastro_user_dto.dart';
import 'package:hastype/data/repositories/user_repository.dart';

class CadastroController {
  CadastroStatus state = CadastroStatus.start;
  SuperCadastroStatus superState = SuperCadastroStatus.start;
  

  Future<dynamic> start(CadastroUserDto model) async {
    state = CadastroStatus.loading;

    try {
      final response = await UserRepository().singupUser(model);

      state = CadastroStatus.created;
      superState = SuperCadastroStatus.sucess;

      return response;
    } on DioException catch (e) {
      superState = SuperCadastroStatus.error;
      if (e.type == DioExceptionType.badResponse) {
        state = CadastroStatus.emailExists;
        return e.response?.data;
      } else if (e.type == DioExceptionType.connectionError) {
        state = CadastroStatus.noInternet;
        return "Falha na conecção. Tente novamente!";
      }
    }
  }
}

enum CadastroStatus {
  start,
  created,
  emailExists,
  noInternet,
  loading,
}

enum SuperCadastroStatus{ 
  start, 
  sucess,
  error
}
