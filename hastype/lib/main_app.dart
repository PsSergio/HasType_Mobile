import 'package:flutter/material.dart';
import 'package:hastype/models/session_model.dart';
import 'package:hastype/views/cadastro_page.dart';
import 'package:hastype/views/first_page.dart';
import 'package:hastype/views/home_page.dart';
import 'package:hastype/views/login_page.dart';

class MainApp extends StatelessWidget{
  SessionModel tempModel = SessionModel(id: "73429a57-881f-4c4e-90cf-5f756e4cc7c5", userId: "32e90b47-c163-45cc-8ba0-b63ae4627c68");
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(sessionModel: tempModel),
      theme: ThemeData(
        
        scaffoldBackgroundColor: const Color.fromRGBO(50, 52, 55, 1),
        // fontFamily: GoogleFonts.jetBrainsMono()
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'JetBrainsMono', color: Colors.white)),
        hintColor: const Color.fromRGBO(100, 102, 105, 1),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromRGBO(226, 183, 20, 1)
        )
      ),
    );
  }
  
}