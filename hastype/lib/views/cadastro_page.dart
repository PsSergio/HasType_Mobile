import 'package:flutter/material.dart';
import 'package:hastype/components/button_default.dart';
import 'package:hastype/components/input_box.dart';
import 'package:hastype/components/loading_component.dart';
import 'package:hastype/components/modal_error.dart';
import 'package:hastype/components/text_default.dart';
import 'package:hastype/data/controllers/cadastro_controller.dart';
import 'package:hastype/data/dtos/cadastro_user_dto.dart';
import 'package:hastype/views/home_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final CadastroController cadastroController = CadastroController();

  String errorMsg = "";
  bool errorIsVisible = false;
  bool loadingIsVisible = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  // height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 50,
                          )),
                      SizedBox(
                        height: 70,
                      ),
                      TextDefault(
                          text: "Se cadastre para jogar!", fontSize: 28),
                    ],
                  ),
                ),
                SizedBox(
                  // height: 250,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InputBox(
                        text: "Nome",
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputBox(
                        text: "Email",
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputBox(
                        text: "Senha",
                        controller: senhaController,
                      ),
                    ],
                  ),
                ),
                ButtonDefault(
                    text: "Cadastrar",
                    onPressed: () async {
                      if (nameController.text != "" &&
                          emailController.text != "" &&
                          senhaController.text != "") {
                        setState(() {
                          loadingIsVisible = true;
                        });

                        final response = await cadastroController.start(CadastroUserDto(
                            nome: nameController.text.trim(),
                            email: emailController.text.trim(),
                            senha: senhaController.text.trim()));

                        setState(() {
                          loadingIsVisible = false;

                          if(cadastroController.superState == SuperCadastroStatus.error){
                            errorMsg = response.toString();
                            errorIsVisible = true;
                          }else{ 
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                        });
                      }
                    })
              ],
            ),
          ),
        ),
        ModalError(errorIsVisible: errorIsVisible, errorMsg: errorMsg),
        LoadingComponent(isVisible: loadingIsVisible)
      ]),
    );
  }
}
