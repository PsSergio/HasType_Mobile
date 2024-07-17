import 'package:flutter/material.dart';
import 'package:hastype/models/session_model.dart';
import 'package:hastype/views/home_page.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
      ),
    );
  }
}