import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hastype/views/cadastro_page.dart';
import 'package:hastype/views/first_page.dart';

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: CadastroPage(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(50, 52, 55, 100),
        // fontFamily: GoogleFonts.jetBrainsMono()
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        textTheme: TextTheme(bodyMedium: GoogleFonts.jetBrainsMono(color: Colors.white)),
        hintColor: Color.fromRGBO(100, 102, 105, 100),
      ),
    );
  }
  
}