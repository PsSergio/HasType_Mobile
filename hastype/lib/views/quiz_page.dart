import 'dart:async';

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hastype/components/button_default.dart';
import 'package:hastype/components/input_box.dart';
import 'package:hastype/components/text_default.dart';
import 'package:hastype/data/controllers/quiz_controller.dart';
import 'package:hastype/data/dtos/finish_quiz_dto.dart';
import 'package:hastype/data/dtos/finish_quiz_response_dto.dart';
import 'package:hastype/data/dtos/start_quiz_response_dto.dart';
import 'package:hastype/models/resposta_model.dart';
import 'package:hastype/models/session_model.dart';
import 'package:hastype/views/feedback_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vibration/vibration.dart';

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

  List<RespostaModel> respostas = [];

  late FinishQuizDto jsonToSend;

  String wordQuestion = "";
  int score = 0;
  int startTimer = 3;
  int indexQuestion = 0;
  bool startTimerIsVisible = true;

  bool stopTimer = false;

  int hours = 0;
  int minutes = 0;
  int seconds = 0;

  String timerFormated = "";

  @override
  void initState() {
    super.initState();
    processToStartQuiz();
  }

  Future processToStartQuiz() async {
    await _startTimer();

    await getResponse();

    startQuizTimer(stopTimer);

    print(response.palavras.last.palavraNormal);

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

  startQuizTimer(bool stopTimer) async {
    while (!stopTimer) {
      await Future.delayed(const Duration(seconds: 1));

      if (seconds < 59) {
        seconds++;
      } else {
        seconds = 0;
        minutes++;

        if (minutes == 59) {
          minutes = 0;
          hours++;
        }
      }
      formatTimer();
    }
  }

  formatTimer() {
    String secondsFormated = "${seconds}s",
        minutesFormated = "${minutes}min",
        hoursFormated = "${hours}h";

    if (seconds == 0) {
      secondsFormated = "";
    }
    if (minutes == 0) {
      minutesFormated = "";
    }
    if (hours == 0) {
      hoursFormated = "";
    }

    setState(() {
      timerFormated = "$hoursFormated$minutesFormated$secondsFormated";
    });
  }

  setWordQuiz() {
    setState(() {
      wordQuestion = response.palavras[indexQuestion].palavraNormal;
    });
  }

  setScoreQuiz(String answer) {
    if (answer.trim().toLowerCase() ==
        response.palavras[indexQuestion].palavraTraduzida
            .toString()
            .toLowerCase()) {
      setState(() {
        score++;
      });
    }
  }

  double getProgressBarValue() {
    return indexQuestion.toDouble() / 10;
  }

  _hideTimer() {
    setState(() {
      startTimerIsVisible = false;
    });
  }

  saveAnswerInObject() {
    final palavraId = response.palavras[indexQuestion].id;
    final resposta =
        "${quizInputController.text[0].toUpperCase()}${quizInputController.text.substring(1).toLowerCase()}"
            .trim();

    print("Resposta: " + resposta.toString());

    final model = RespostaModel(palavraId: palavraId, resposta: resposta);

    respostas.add(model);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
                                child: LinearPercentIndicator(
                                  animateFromLastPercent: true,
                                  curve: Curves.easeInOut,
                                  animation: true,
                                  lineHeight: 20,
                                  backgroundColor:
                                      const Color.fromRGBO(44, 46, 49, 1),
                                  progressColor:
                                      const Color.fromRGBO(100, 102, 105, 1),
                                  percent: getProgressBarValue(),
                                  barRadius: const Radius.circular(30),
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
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Tempo: $timerFormated",
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold)),
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
                  ButtonDefault(
                      text: "Confirmar",
                      onPressed: () async {
                        if (quizInputController.text == "") return;

                        setScoreQuiz(quizInputController.text);

                        saveAnswerInObject();
                        if (indexQuestion < 9) {
                          await HapticFeedback.heavyImpact();

                          indexQuestion++;
                          setWordQuiz();
                          quizInputController.text = "";

                        } else {
                          jsonToSend = FinishQuizDto(
                              respostas: respostas); // get all answers

                          FinishQuizResponseDto finishResponse =
                              await quizController.finishQuiz(
                                  response.quiz.id, jsonToSend);

                          stopTimer = true; // stop timer

                          setState(() {
                            indexQuestion++; // just complete the progress bar
                          });

                          Vibration.vibrate(duration: 1000); // vibration

                          await Future.delayed(const Duration(seconds: 2));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FeedbackPage(
                                        finishQuizResponseDto: finishResponse,
                                        timeFormated: timerFormated,
                                        sessionModel: sessionModel,
                                      )));
                        }
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
      ),
    );
  }
}
