import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:hastype/components/button_default.dart';
import 'package:hastype/components/input_box.dart';
import 'package:hastype/components/loading_component.dart';
import 'package:hastype/data/controllers/home_controller.dart';
import 'package:hastype/models/session_model.dart';
import 'package:hastype/views/first_page.dart';
import 'package:hastype/views/main_super_page.dart';
import 'package:hastype/views/quiz_page.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      required this.sessionModel, required this.showError, required this.setLoading});
  final SessionModel sessionModel;
  final Function(String value) showError;
  final Function(bool value) setLoading;

  @override
  State<HomePage> createState() => _HomePageState(
      sessionModel: sessionModel,
      showError: showError,
      setLoading: setLoading);
}

class _HomePageState extends State<HomePage> {
  _HomePageState( 
      {required this.sessionModel,
      required this.showError,
      required this.setLoading});

  final quizController = TextEditingController();

  final homeController = HomeController();
  final SessionModel sessionModel;

  final Function(String value) showError;
  final Function(bool value) setLoading;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(
        children: [
          Scaffold(
            // backgroundColor: const Color.fromRGBO(50, 52, 55, 1),
            resizeToAvoidBottomInset: false,

            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Blur(
                      blur: 7,
                      blurColor: const Color.fromRGBO(50, 52, 55, 1),
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
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Tempo: 4s",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(
                              height: 50,
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
                  ),
                  ButtonDefault(
                      text: "Começar",
                      onPressed: () async {
                        widget.setLoading(true);

                        final response =
                            await homeController.preStartQuiz(sessionModel.id);

                        widget.setLoading(false);

                        setState(() {

                          if (homeController.preQuizState ==
                              PreQuizStates.error) {
                          
                            widget.showError(response.toString());

                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuizPage(
                                          sessionModel: sessionModel,
                                        )));
                          }
                        });
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
