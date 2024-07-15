import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:hastype/components/button_default.dart';
import 'package:hastype/components/input_box.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final quizController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          child: Container(
                              width: 300,
                              height: 20,
                              child: const ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                child: LinearProgressIndicator(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  backgroundColor:
                                      Color.fromRGBO(44, 46, 49, 1),
                                  color: Color.fromRGBO(100, 102, 105, 1),
                                  value: .5,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("World",
                                style: TextStyle(
                                    color: Color.fromRGBO(100, 102, 105, 1),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Pontuação: 4",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Tempo: 4s",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(
                          height: 75,
                        ),
                        SizedBox(
                            width: 300,
                            child: InputBox(
                                text: "Digite aqui",
                                controller: quizController))
                      ],
                    ),
                  ),
                ),
                ButtonDefault(text: "Confirmar", onPressed: () async {
                  
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
