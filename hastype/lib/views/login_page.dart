import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hastype/components/button_default.dart';
import 'package:hastype/components/input_box.dart';
import 'package:hastype/components/loading_component.dart';
import 'package:hastype/components/text_default.dart';
import 'package:hastype/data/controllers/login_controller.dart';
import 'package:hastype/data/dtos/login_user_dto.dart';
import 'package:hastype/views/home_page.dart';

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
                        TextDefault(text: "Entre na sua conta!", fontSize: 28),
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
                        // if (senhaController.text != "" &&
                        //     emailController.text != "") {
                        setState(() {
                          loadingIsVisible = true;
                        });

                        // final response = await loginController.start(
                        //     LoginUserDto(
                        //         email: emailController.text.trim(),
                        //         senha: senhaController.text.trim()));

                        final response = await loginController.start(
                            LoginUserDto(
                                email: "sergioamcosta@gmail.com",
                                senha: "312151"));

                        setState(() {
                          loadingIsVisible = false;

                          if (loginController.state != LoginStates.logged &&
                              loginController.state != LoginStates.loading) {
                            errorIsVisible = true;
                            errorMsg = response.toString();
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                        });

                        // }
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
          LoadingComponent(isVisible: loadingIsVisible)
        ],
      ),
    );
  }
}
