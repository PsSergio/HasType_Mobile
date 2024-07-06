import 'package:flutter/material.dart';

class ErrorModal extends StatefulWidget {
  const ErrorModal({super.key, required this.isVisible, required this.errorMsg});
  final bool isVisible;
  final String errorMsg;

  @override
  State<ErrorModal> createState() => _ErrorModalState(isVisible: isVisible, errorMsg: errorMsg);
}

class _ErrorModalState extends State<ErrorModal> {
  final bool isVisible;
  final String errorMsg;

  _ErrorModalState({required this.isVisible, required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
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
                        style: const TextStyle(fontSize: 20),
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
}

// class ErrorModal extends StatelessWidget {
//   const ErrorModal({super.key, required this.isVisible, required this.errorMsg});

//   final bool isVisible;
//   final String errorMsg;

//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: isVisible,
//       child: SizedBox(
//         width: 400,
//         height: double.infinity,
//         child: Container(
//           color: const Color.fromARGB(171, 41, 41, 41),
//           alignment: Alignment.bottomCenter,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               SizedBox(
//                 height: 150,
//                 child: Align(
//                   alignment: const FractionalOffset(0.9, 0.5),
//                   child: IconButton(
//                     icon: const Icon(Icons.close_rounded,
//                         color: Colors.white, size: 50),
//                     onPressed: () {
                      
//                     },
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 color: const Color.fromARGB(255, 238, 99, 89),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         errorMsg,
//                         style: const TextStyle(fontSize: 20),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }