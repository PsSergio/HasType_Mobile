import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputBox extends StatelessWidget {
  const InputBox({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(44, 46, 49, 100),
          border: OutlineInputBorder(),
          hintText: "Nome"
          ),
    );
  }
}
