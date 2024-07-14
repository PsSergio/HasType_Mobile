import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Image(
          image: AssetImage('assets/images/logo.png'),
          width: 40,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {},
                icon: Image(image: AssetImage('assets/images/logout.png')),
              )),
        ],
      ),
      body: Center(),
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
    );
  }
}
