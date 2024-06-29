import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class TextDefault extends StatelessWidget{
 
  @override

  final String text;
  final double fontSize;

  const TextDefault({super.key, required this.text, required this.fontSize});

  Widget build(BuildContext context) {
    return Text(
    text,
    style:
    GoogleFonts.jetBrainsMono(
      // color: Colors.white,
      fontSize: fontSize,
      fontWeight: FontWeight.bold
    ), 
    
  );
  }
}