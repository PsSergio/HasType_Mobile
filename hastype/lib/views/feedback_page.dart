import 'package:flutter/material.dart';
import 'package:hastype/components/button_default.dart';
import 'package:hastype/components/dark_button_default.dart';
import 'package:hastype/components/text_default.dart';
import 'package:hastype/data/dtos/finish_quiz_response_dto.dart';
import 'package:hastype/models/session_model.dart';
import 'package:hastype/views/main_super_page.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage(
      {super.key,
      required this.timeFormated,
      required this.finishQuizResponseDto, required this.sessionModel});

  final String timeFormated;
  final FinishQuizResponseDto finishQuizResponseDto;
  final SessionModel sessionModel;

  @override
  State<FeedbackPage> createState() => _FeedbackPageState(
      timeFormated: timeFormated, finishQuizResponseDto: finishQuizResponseDto, sessionModel: sessionModel,);
}

class _FeedbackPageState extends State<FeedbackPage> {
  final String timeFormated;
  final FinishQuizResponseDto finishQuizResponseDto;
  final SessionModel sessionModel;

  _FeedbackPageState( 
      {required this.timeFormated, required this.finishQuizResponseDto, required this.sessionModel});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    const TextDefault(text: "Resultados:", fontSize: 32),
                    SizedBox(
                      height: 100,
                    ),
                    Column(
                      children: [
                        TextDefault(
                            text:
                                "Pontuação: ${finishQuizResponseDto.pontuacao}/10",
                            fontSize: 30),
                        TextDefault(
                            text: "Tempo: ${timeFormated}", fontSize: 30),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    ButtonDefault(text: "Ver Ranking", onPressed: () {}),
                    SizedBox(
                      height: 20,
                    ),
                    DarkButtonDefault(
                        text: "Voltar",
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainSuperPage(
                                        sessionModel: sessionModel,
                                      )));
                        })
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
