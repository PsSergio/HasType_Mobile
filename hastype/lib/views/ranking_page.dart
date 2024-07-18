import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hastype/components/text_table.dart';
import 'package:hastype/data/controllers/ranking_controller.dart';

class RankingPage extends StatefulWidget {
  const RankingPage(
      {super.key, required this.showError, required this.setLoading});
  final Function(String value) showError;
  final Function(bool value) setLoading;

  @override
  State<RankingPage> createState() =>
      _RankingPageState(showError: showError, setLoading: setLoading);
}

class _RankingPageState extends State<RankingPage> {
  _RankingPageState({required this.showError, required this.setLoading});

  final rankingController = RankingController();

  final Function(String value) showError;
  final Function(bool value) setLoading;

  bool canLoadRankingTempo = false;
  bool canLoadRankingPontuacao = false;

  List listModels = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tempoFetchApi();
    });
  }

  tempoFetchApi() async {
    canLoadRankingPontuacao = false;
    canLoadRankingTempo = false;

    listModels.clear();

    widget.setLoading(true);

    final response = await fetchRankingTempo(rankingController);

    widget.setLoading(false);

    setState(() {
      if (rankingController.state == RankingStates.error) {
        widget.showError(response.toString());
        return;
      }

      canLoadRankingTempo = true;
      listModels = response;
      return;
    });
  }

  pontuacaoFetchApi() async {
    canLoadRankingPontuacao = false;
    canLoadRankingTempo = false;

    listModels.clear();

    widget.setLoading(true);

    final response = await fetchRankingPontuacao(rankingController);

    widget.setLoading(false);

    setState(() {
      if (rankingController.state == RankingStates.error) {
        widget.showError(response.toString());
        return;
      }

      canLoadRankingPontuacao = true;
      listModels = response;
      return;
    });
  }

  List<TableRow> _sucessResponse() {
    if (!canLoadRankingPontuacao && !canLoadRankingTempo)
      return [createEmptyRowTable()];

    if (canLoadRankingPontuacao) {
      return List.generate(
          listModels.length,
          (index) => createRowTable(
              (index + 1).toString(),
              listModels[index].userName,
              listModels[index].pontuacao.toString()));
    }

    return List.generate(
        listModels.length,
        (index) => createRowTable((index + 1).toString(),
            listModels[index].userName, listModels[index].tempo.toString()));
  }

  formatarTempo() {}

  @override
  // ignore: override_on_non_overriding_member
  Color backgroundColorButton1 = Colors.white;
  Color backgroundColorButton2 = Colors.transparent;
  Color textColorButton2 = Colors.white;
  Color textColorButton1 = Color.fromRGBO(40, 44, 49, 1);

  double widthButton1 = 0;
  double widthButton2 = 5;
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
                        onPressed: () {
                          backgroundColorButton1 = Colors.white;
                          backgroundColorButton2 = Colors.transparent;

                          textColorButton2 = Colors.white;
                          textColorButton1 = Color.fromRGBO(40, 44, 49, 1);

                          widthButton2 = 5;
                          widthButton1 = 0;
                          tempoFetchApi();
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: backgroundColorButton1,
                            side: BorderSide(
                              color: const Color.fromRGBO(40, 44, 49, 1),
                              width: widthButton1,
                            )),
                        child: Text(
                          "Tempo",
                          style: TextStyle(
                              color: textColorButton1,
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
                        onPressed: () {
                          backgroundColorButton2 = Colors.white;
                          backgroundColorButton1 = Colors.transparent;

                          textColorButton1 = Colors.white;
                          textColorButton2 = Color.fromRGBO(40, 44, 49, 1);

                          widthButton1 = 5;
                          widthButton2 = 0;
                          pontuacaoFetchApi();
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: backgroundColorButton2,
                            side: BorderSide(
                              color: const Color.fromRGBO(40, 44, 49, 1),
                              width: widthButton2,
                            )),
                        child: Text(
                          "Pontuação",
                          style: TextStyle(
                              color: textColorButton2,
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
                      ..._sucessResponse(),
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

Future fetchRankingTempo(RankingController controller) async {
  return await controller.showRankingTempo();
}

Future fetchRankingPontuacao(RankingController controller) async {
  return await controller.showRankingPontuacao();
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
