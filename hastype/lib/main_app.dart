import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hastype/views/cadastro_page.dart';
import 'package:hastype/views/first_page.dart';

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: const CadastroPage(),
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