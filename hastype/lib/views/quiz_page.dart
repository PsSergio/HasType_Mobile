import 'dart:async';

import 'package:blur/blur.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hastype/components/button_default.dart';
import 'package:hastype/components/input_box.dart';
import 'package:hastype/components/text_default.dart';
import 'package:hastype/data/controllers/quiz_controller.dart';
import 'package:hastype/data/dtos/start_quiz_response_dto.dart';
import 'package:hastype/models/session_model.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.sessionModel});
  final SessionModel sessionModel;

  @override
  State<QuizPage> createState() => _QuizPageState(sessionModel: sessionModel);
}

class _QuizPageState extends State<QuizPage> {
  _QuizPageState({required this.sessionModel});

  final SessionModel sessionModel;

  final quizInputController = TextEditingController();

  final quizController = QuizController();

  late StartQuizResponseDto response;

  String wordQuestion = "";
  int score = 0;
  int startTimer = 3;
  int indexQuestion = 0;
  bool startTimerIsVisible = true;

  @override
  void initState() {
    super.initState();
    processToStartQuiz();
  }

  Future processToStartQuiz() async {
    await _startTimer();

    getResponse();

    _hideTimer();
  }

  Future getResponse() async {
    response = await quizController.startQuiz(sessionModel.id);

    setWordQuiz();
  }

  _startTimer() async {
    startTimer = 3;
    while (startTimer != 0) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        startTimer -= 1;
      });
    }
    return true;
  }

  setWordQuiz() {
    setState(() {
      wordQuestion = response.palavras[indexQuestion].palavraNormal;
    });
  }

  setScoreQuiz(String answer) {
    if (answer.trim().toLowerCase() == response.palavras[indexQuestion].palavraTraduzida.toString().toLowerCase()) {
      setState(() {
        score++;
      });
    }
  }

  double getProgressBarValue(){
    return indexQuestion.toDouble()/10;
  }

  _hideTimer() {
    setState(() {
      startTimerIsVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(30)),
                                child: LinearProgressIndicator(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                  backgroundColor:
                                      const Color.fromRGBO(44, 46, 49, 1),
                                  color: const Color.fromRGBO(100, 102, 105, 1),
                                  value: getProgressBarValue(),
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(wordQuestion,
                                style: const TextStyle(
                                    color: Color.fromRGBO(100, 102, 105, 1),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text("Pontuação: $score",
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text("Tempo: 4s",
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
                                controller: quizInputController))
                      ],
                    ),
                  ),
                ),
                ButtonDefault(text: "Confirmar", onPressed: () {
                  if(indexQuestion != 9){
                    setWordQuiz();
                    setScoreQuiz(quizInputController.text);
                  }else{
                    // to feedback page
                  }
                  indexQuestion++;
                })
              ],
            ),
          ),
          Visibility(
            visible: startTimerIsVisible,
            child: Stack(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Blur(
                    blur: 7,
                    blurColor: Color.fromRGBO(50, 52, 55, 1),
                    child: SizedBox(),
                  ),
                ),
                Center(
                  child:
                      TextDefault(text: startTimer.toString(), fontSize: 100),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
