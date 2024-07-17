import 'package:flutter/material.dart';
import 'package:hastype/components/loading_component.dart';
import 'package:hastype/data/controllers/home_controller.dart';
import 'package:hastype/models/session_model.dart';
import 'package:hastype/views/first_page.dart';
import 'package:hastype/views/home_page.dart';
import 'package:hastype/views/ranking_page.dart';

class MainSuperPage extends StatefulWidget {
  const MainSuperPage({super.key, required this.sessionModel});
  final SessionModel sessionModel;

  @override
  State<MainSuperPage> createState() =>
      _MainSuperPageState(sessionModel: sessionModel);
}

class _MainSuperPageState extends State<MainSuperPage> {
  _MainSuperPageState({required this.sessionModel});
  late final SessionModel sessionModel;

  late final screens = [HomePage(sessionModel: sessionModel), RankingPage()];

  int _index = 0;

  final quizController = TextEditingController();

  final homeController = HomeController();

  String iconTabBar1Asset = "assets/images/home_enable.png";
  String iconTabBar2Asset = "assets/images/ranking_desable.png";

  String errorMsg = "";
  bool errorIsVisible = false;
  bool loadingIsVisible = false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Stack(children: [
        Scaffold(
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
          body: screens[_index],
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: (int index) {
              if (index == 0) {
                iconTabBar1Asset = "assets/images/home_enable.png";
                iconTabBar2Asset = "assets/images/ranking_desable.png";
              } else {
                iconTabBar1Asset = "assets/images/home_desable.png";
                iconTabBar2Asset = "assets/images/ranking_enable.png";
              }
              setState(() {
                _index = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Image.asset(iconTabBar1Asset), label: ""),
              BottomNavigationBarItem(
                icon: Image.asset(iconTabBar2Asset),
                label: "",
              )
            ],
            backgroundColor: const Color.fromRGBO(44, 46, 49, 1),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FirstPage()));
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
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
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
      ]),
    );
  }
}
