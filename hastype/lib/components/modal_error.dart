import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ModalError extends StatelessWidget {
  ModalError({super.key, required this.errorIsVisible, required this.errorMsg});
  bool errorIsVisible;
  String errorMsg;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Visibility(
                visible: errorIsVisible,
                child: SizedBox(
                  width: 400,
                  height: double.infinity,
                  child: Container(
                    color: const Color.fromARGB(171, 41, 41, 41),
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 150,
                          child: Align(
                            alignment: const FractionalOffset(0.9, 0.5),
                            child: IconButton(
                              icon: const Icon(Icons.close_rounded,
                                  color: Colors.white, size: 50),
                              onPressed: () {
                                setState(() {
                                  errorIsVisible = false;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          color: const Color.fromARGB(255, 238, 99, 89),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  errorMsg,
                                  style: const TextStyle(fontSize: 15, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      }
    );
  }
}