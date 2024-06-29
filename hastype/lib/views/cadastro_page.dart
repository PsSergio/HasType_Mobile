import 'package:flutter/material.dart';
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
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 400,
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                  children: [
                    Align(alignment: Alignment.topLeft, child: Icon(Icons.arrow_back, color: Colors.white, size: 50,)),
                    TextDefault(text: "Se cadastre para jogar!", fontSize: 28),
                
                  ],
                ),
              ),

              InputBox()
            ],
          ),
        ),
      ),
    );
  }
}