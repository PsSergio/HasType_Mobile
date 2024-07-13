import 'package:flutter/material.dart';

class DarkButtonDefault extends StatelessWidget {
  const DarkButtonDefault({super.key, required this.text, required this.onPressed});

  final Function() onPressed; 
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        textStyle: const TextStyle(
          
          fontFamily: "JetBrainsMono",
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.white
          ) ,
        backgroundColor: Color.fromRGBO(44, 46, 49, 1),
        padding: const EdgeInsets.all(20),
        fixedSize: const Size(300, 70),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
