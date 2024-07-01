import 'package:flutter_test/flutter_test.dart';
import 'package:hastype/data/dtos/cadastro_user_dto.dart';
import 'package:hastype/data/repositories/user_repository.dart';

void main() {
  
  final repository = UserRepository();

  test("add user in data base using api", () async {
    print(repository.postUser({"João Paulo", "joaopaulo2@gmail.com", "joaoPaulo123"} as CadastroUserDto));
  });

}