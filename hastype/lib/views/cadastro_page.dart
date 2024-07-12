import 'package:flutter/material.dart';
import 'package:hastype/components/button_default.dart';
import 'package:hastype/components/input_box.dart';
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

  _loading(bool isVisible) {
    return Visibility(
        visible: isVisible,
        child: SizedBox(
          width: 400,
          height: double.infinity,
          child: Container(
            color: const Color.fromARGB(171, 41, 41, 41),
            child: const Center(child: CircularProgressIndicator()),
          ),
        ));
  }

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

                        await cadastroController.start(CadastroUserDto(
                            nome: nameController.text.trim(),
                            email: emailController.text.trim(),
                            senha: senhaController.text.trim()));

                        setState(() {
                          loadingIsVisible = false;

                          if (cadastroController.state ==
                              CadastroStatus.emailExists) {
                            errorMsg = "Este email já está cadastrado!";
                            errorIsVisible = true;
                          } else if (cadastroController.state ==
                              CadastroStatus.noInternet) {
                            errorMsg = "Falha na conecção. Tente novamente!";
                            errorIsVisible = true;
                          } else if (cadastroController.state ==
                              CadastroStatus.created) {
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
        Visibility(
          visible: errorIsVisible,
          child: SizedBox(
            width: 400,
            height: double.infinity,
            child: Container(
              color: const Color.fromARGB(171, 41, 41, 41),
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 150,
                    child: Align(
                      alignment: const FractionalOffset(0.9, 0.5),
                      child: IconButton(
                        icon: const Icon(Icons.close_rounded,
                            color: Colors.white, size: 50),
                        onPressed: () {
                          setState(() {
                            errorIsVisible = false;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    color: const Color.fromARGB(255, 238, 99, 89),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            errorMsg,
                            style: const TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        _loading(loadingIsVisible)
      ]),
    );
  }
}
