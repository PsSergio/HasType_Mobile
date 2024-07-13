import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextDefault extends StatelessWidget{
 
  final String text;
  final double fontSize;

  const TextDefault({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
    text,
    style:
    TextStyle(
      // color: Colors.white,
      fontFamily: 'JetBrainsMono',
      fontSize: fontSize,
      fontWeight: FontWeight.bold
    ), 
    
  );
  }
}