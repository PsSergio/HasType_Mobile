import 'package:flutter/material.dart';
import 'package:hastype/components/loading_component.dart';
import 'package:hastype/components/modal_error.dart';
import 'package:hastype/data/controllers/home_controller.dart';
import 'package:hastype/models/session_model.dart';
import 'package:hastype/views/first_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.sessionModel});
  final SessionModel sessionModel;

  @override
  State<HomePage> createState() => _HomePageState(sessionModel: sessionModel);
}

class _HomePageState extends State<HomePage> {
  _HomePageState({required this.sessionModel});

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

                      final response = await homeController.logoutUser(sessionModel.userId);
                      
                      setState(() {
                        loadingIsVisible = false;

                        if(homeController.superLogoutState == SuperLogoutStates.error){
                          errorIsVisible = true;
                          errorMsg = response.toString();
                        }else{
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FirstPage()));
                        }
                      });
                    },
                    icon: const Image(image: AssetImage('assets/images/logout.png')),
                  )),
            ],
          ),
          body: Stack(
            children: [
              
            ],
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
