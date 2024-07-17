import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hastype/components/text_table.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

TableRow createTitleTable(String tempoOrPontuacao) {
  return TableRow(
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.white,
        width: 1,
      ))),
      children: [
        const TableCell(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: TextTable(text: "nº", color: Colors.white),
        )),
        const TableCell(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: TextTable(text: "nome", color: Colors.white),
        )),
        TableCell(
            child: Padding(
          padding: const EdgeInsets.all(8),
          child: TextTable(text: tempoOrPontuacao, color: Colors.white),
        )),
      ]);
}

TableRow createRowTable(String position, String name, String lastColumn) {
  Color colorPosition = Colors.white;
  switch (position) {
    case "1":
      colorPosition = const Color.fromRGBO(226, 183, 20, 1);
    case "2":
      colorPosition = const Color.fromRGBO(104, 104, 104, 1);
    case "3":
      colorPosition = const Color.fromRGBO(167, 95, 28, 1);
    default:
      colorPosition = Colors.white;
  }

  return TableRow(children: [
    TableCell(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 9, top: 8, right: 8),
      child: TextTable(text: position, color: colorPosition),
    )),
    TableCell(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 9, top: 8, right: 8),
      child: TextTable(text: name, color: Colors.white),
    )),
    TableCell(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 30, left: 9, top: 8, right: 8),
      child: TextTable(text: lastColumn, color: Colors.white),
    )),
  ]);
}

TableRow createEmptyRowTable() {
  return const TableRow(children: [
    TableCell(child: Padding(padding: EdgeInsets.all(15))),
    TableCell(child: Padding(padding: EdgeInsets.all(15))),
    TableCell(child: Padding(padding: EdgeInsets.all(15))),
  ]);
}

class _RankingPageState extends State<RankingPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: TextButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll<Color>(Colors.white),
                          ),
                          child: const Text(
                            "Tempo",
                            style: TextStyle(
                                color: Color.fromRGBO(40, 44, 49, 1),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              side: const BorderSide(
                            color: Color.fromRGBO(40, 44, 49, 1),
                            width: 5,
                          )),
                          child: const Text(
                            "Pontuação",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 350,
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1.5),
                        1: FlexColumnWidth(5),
                        2: FlexColumnWidth(3)
                      },
                      children: [
                        createTitleTable("tempo"),
                        createEmptyRowTable(),
                        // ...List.generate(20,
                        //     (index) => createRowTable(index.toString(), "Paulo Sergio", "53s"))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );
  }
}
