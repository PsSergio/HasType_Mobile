import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key, required this.isVisible});

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isVisible,
        child: SizedBox(
          width: 400,
          height: double.infinity,
          child: Container(
            color: const Color.fromARGB(171, 41, 41, 41),
            child: const Center(child: CircularProgressIndicator()),
          ),
        ));;
  }
}