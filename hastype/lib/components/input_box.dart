import 'dart:ui';

import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {

  final String text;

  final TextEditingController controller;
  
  const InputBox({super.key, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        style: const TextStyle(
          fontFamily: "JetBrainsMono",
          color: Color.fromRGBO(100, 102, 105, 100),
          fontSize: 20
        ),
      
        decoration: InputDecoration(  
      
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
            filled: true,
            fillColor: const Color.fromRGBO(44, 46, 49, 1),
          
            hintText: text,
            
            ),
      );
    
  }
}
