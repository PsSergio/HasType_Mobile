import 'package:flutter_test/flutter_test.dart';
import 'package:hastype/repositories/user_repository.dart';

void main() {
  
  final repository = UserRepository();

  test("add user in data base using api", () async {
    print(repository.postUser("João Paulo", "joaopaulo@gmail.com", "joaoPaulo123"));
  });

}