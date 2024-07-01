import 'package:flutter/material.dart';
import 'package:hastype/data/controllers/cadastro_controller.dart';
import 'package:hastype/data/dtos/cadastro_user_dto.dart';
import 'package:hastype/data/repositories/user_repository.dart';

class ButtonDefault extends StatelessWidget {
  const ButtonDefault({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        CadastroController controller = CadastroController(); 
        print(controller.start(CadastroUserDto(nome: "João Paulo2", email: "joaopaulo252@gmail.com", senha: "joaoPaulo123")).toString());
      },
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          
          fontFamily: "JetBrainsMono",
          fontWeight: FontWeight.bold,
          fontSize: 25,
          ) ,
        backgroundColor: Colors.white,
        padding: EdgeInsets.all(20),
        fixedSize: Size(300, 70),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text, style: TextStyle(color: Color.fromRGBO(50, 52, 55, 1))),
    );
  }
}
