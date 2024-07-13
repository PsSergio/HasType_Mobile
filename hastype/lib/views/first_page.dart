import 'package:flutter/material.dart';
import 'package:hastype/components/button_default.dart';
import 'package:hastype/components/dark_button_default.dart';
import 'package:hastype/components/text_default.dart';
import 'package:hastype/views/cadastro_page.dart';
import 'package:hastype/views/login_page.dart';

class FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FirstPageState();
  }
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: AssetImage('assets/images/logo.png')),
                SizedBox(
                  width: 2,
                ),
                Text(
                  "hasType",
                  style: TextStyle(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      fontSize: 34,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 350,
            ),
            Column(
              children: [
                ButtonDefault(
                    text: "Entrar",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()));
                    }),
                const SizedBox(
                  height: 20,
                ),
                DarkButtonDefault(
                    text: "Cadastrar",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CadastroPage()));
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
