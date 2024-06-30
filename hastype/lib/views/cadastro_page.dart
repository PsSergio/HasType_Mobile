import 'package:flutter/material.dart';
import 'package:hastype/components/button_default.dart';
import 'package:hastype/components/input_box.dart';
import 'package:hastype/components/text_default.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(

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
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 50,
                        )),
                    SizedBox(height: 70,),

                    TextDefault(text: "Se cadastre para jogar!", fontSize: 28),
                  ],
                ),
              ),

              SizedBox(
                // height: 250,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InputBox(text: "Nome"),
                    SizedBox(height: 20,),
                    InputBox(text: "Email"),
                    SizedBox(height: 20,),
                    InputBox(text: "Senha"),
                  ],
                ),

              ),
              
              ButtonDefault(text: "Cadastrar")
            ],
          ),
        ),
      ),
    );
  }
}
