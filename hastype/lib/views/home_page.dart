import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:flutter_rounded_progress_bar/rounded_progress_bar_style.dart';
import 'package:hastype/components/button_default.dart';
import 'package:hastype/components/input_box.dart';
import 'package:hastype/components/loading_component.dart';
import 'package:hastype/components/modal_error.dart';
import 'package:hastype/data/controllers/home_controller.dart';
import 'package:hastype/models/session_model.dart';
import 'package:hastype/views/first_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.sessionModel});
  final SessionModel sessionModel;

  @override
  State<HomePage> createState() => _HomePageState(sessionModel: sessionModel);
}

class _HomePageState extends State<HomePage> {
  _HomePageState({required this.sessionModel});

  final quizController = TextEditingController();

  final homeController = HomeController();
  final SessionModel sessionModel;

  String errorMsg = "";
  bool errorIsVisible = false;
  bool loadingIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          // backgroundColor: const Color.fromRGBO(50, 52, 55, 1),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            title: const Image(
              image: AssetImage('assets/images/logo.png'),
              width: 40,
            ),
            actions: [
              Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    onPressed: () async {
                      setState(() {
                        loadingIsVisible = true;
                      });

                      final response =
                          await homeController.logoutUser(sessionModel.userId);

                      setState(() {
                        loadingIsVisible = false;

                        if (homeController.superLogoutState ==
                            SuperLogoutStates.error) {
                          errorIsVisible = true;
                          errorMsg = response.toString();
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstPage()));
                        }
                      });
                    },
                    icon: const Image(
                        image: AssetImage('assets/images/logout.png')),
                  )),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: Blur(
                    blur: 7,
                    blurColor: Color.fromRGBO(50, 52, 55, 1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                            child: Container(
                              width: 300,
                              height: 20,
                              child: const ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                child: LinearProgressIndicator(
                                  borderRadius: BorderRadius.all(Radius.circular(30),),
                                  backgroundColor: Color.fromRGBO(44, 46, 49, 1),
                                  color: Color.fromRGBO(100, 102, 105, 1),
                                  value: .5,
                              ),
                            )),
                          ),
                      
                          const SizedBox(height: 100,),
                      
                          const Column(
                      
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("World", style: TextStyle(
                                color: Color.fromRGBO(100, 102, 105, 1),
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                              )),
                              SizedBox(height: 10,),
                              Text("Pontuação: 4", style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              )),
                              SizedBox(height: 10,),
                              Text("Tempo: 4s", style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              )),
                            
                            ],
                          ),
                      
                          const SizedBox(height: 50,),
                      
                      
                          SizedBox(width:300, child: InputBox(text: "Digite aqui", controller: quizController))
                      
                        ],
                      ),
                    ),
                  ),
                ),
                ButtonDefault(text: "Começar", onPressed: () {})
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset('assets/images/home_enable.png'),
                  label: ""),
              BottomNavigationBarItem(
                icon: Image.asset('assets/images/ranking_desable.png'),
                label: "",
              )
            ],
            backgroundColor: const Color.fromRGBO(44, 46, 49, 1),
          ),
        ),
        ModalError(errorIsVisible: errorIsVisible, errorMsg: errorMsg),
        LoadingComponent(isVisible: loadingIsVisible)
      ],
    );
  }
}
