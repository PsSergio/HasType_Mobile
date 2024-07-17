import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hastype/components/button_default.dart';
import 'package:hastype/components/input_box.dart';
import 'package:hastype/components/loading_component.dart';
import 'package:hastype/components/modal_error.dart';
import 'package:hastype/components/text_default.dart';
import 'package:hastype/data/controllers/login_controller.dart';
import 'package:hastype/data/dtos/login_user_dto.dart';
import 'package:hastype/views/home_page.dart';
import 'package:hastype/views/main_super_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = LoginController();

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  String errorMsg = "";
  bool errorIsVisible = false;
  bool loadingIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    // height: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                  size: 50,
                                ))),
                        const SizedBox(
                          height: 70,
                        ),
                        const TextDefault(
                            text: "Entre na sua conta!", fontSize: 28),
                      ],
                    ),
                  ),
                  SizedBox(
                    // height: 250,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
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
                      text: "Entrar",
                      onPressed: () async {
                        if (senhaController.text != "" &&
                            emailController.text != "") {
                          setState(() {
                            loadingIsVisible = true;
                          });

                          final response = await loginController.start(
                              LoginUserDto(
                                  email: emailController.text.trim(),
                                  senha: senhaController.text.trim()));

                          setState(() {
                            loadingIsVisible = false;

                            if (loginController.superState ==
                                SuperLoginStates.error) {
                              errorIsVisible = true;
                              errorMsg = response.toString();
                            } else {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainSuperPage(sessionModel: response)));
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
        ],
      ),
    );
  }
}

closeModalError(bool errorIsVisible){
  errorIsVisible = false;
}