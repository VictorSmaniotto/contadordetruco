import 'package:contadordetruco/vitoria_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _placarNos = 0;
  int _placarEles = 0;
  int _vitoriaEles = 0;
  int _vitoriaNos = 0;
  String _grupoAtual = '';
  int _pontoAtual = 0;

  void aumentarPontos(String grupo, int pontos) {
    _grupoAtual = grupo;
    _pontoAtual = pontos;

    if (grupo == 'NOS') {
      setState(() {
        _placarNos += pontos;
        if (_placarNos >= 12) {
          _vitoriaNos++;

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const VitoriaPage(
                      grupo: 'Nós',
                    )),
          ).then((acao) {
            if (acao == 'desfazer') {
              desfazer();
            } else if (acao == 'novaPartida') {
              novaPartida();
            }
          });
        }
      });

      debugPrint(pontos.toString());
    }

    if (grupo == 'ELES') {
      setState(() {
        _placarEles += pontos;
        if (_placarEles >= 12) {
          _vitoriaEles++;

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const VitoriaPage(
                      grupo: 'Eles',
                    )),
          ).then((acao) {
            if (acao == 'desfazer') {
              desfazer();
            } else if (acao == 'novaPartida') {
              novaPartida();
            }
          });
        }
      });

      debugPrint(_placarEles.toString());
    }
  }

  void novaPartida() {
    setState(() {
      _placarNos = 0;
      _placarEles = 0;
    });
  }

  void novoTorneio() {
    setState(() {
      _placarNos = 0;
      _vitoriaNos = 0;
      _placarEles = 0;
      _vitoriaEles = 0;
    });
  }

  void diminuirPontos(String grupo) {
    if (grupo == 'NOS' && _placarNos > 0) {
      setState(() {
        _placarNos--;
      });
    }

    // if (grupo == 'NOS') {
    //   if (_placarNos > 0) {
    //     setState(() {
    //       _placarNos--;
    //     });
    //   }
    // }

    if (grupo == 'ELES' && _placarEles > 0) {
      setState(() {
        _placarEles--;
      });
    }

    // if (grupo == 'ELES') {
    //   if (_placarEles > 0) {
    //     setState(() {
    //       _placarEles--;
    //     });
    //   }
    // }
  }

  void desfazer() {
    if (_grupoAtual == 'NOS') {
      setState(() {
        _placarNos -= _pontoAtual;
        _vitoriaNos--;
      });
    }

    if (_grupoAtual == 'ELES') {
      setState(() {
        _placarEles -= _pontoAtual;
        _vitoriaEles--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador de Truco"),
        centerTitle: true,
        backgroundColor: const Color(0xFF7D6B7D),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Nós',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Color(0xFF7D6B7D)),
                      ),
                      Container(
                        width: 120,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFDC),
                            border: Border.all(
                                color: const Color(0xFF7D6B7D),
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            _placarNos.toString(),
                            style: const TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE22364),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          diminuirPontos('NOS');
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: const Color(0xFFE5E5E5),
                              border: Border.all(
                                color: const Color(0xFF707070),
                                style: BorderStyle.solid,
                              ),
                              shape: BoxShape.circle),
                          child: const Text(
                            '-1',
                            style: TextStyle(
                                fontSize: 30, color: Color(0xFF707070)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          aumentarPontos('NOS', 1);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7D6B7D),
                            minimumSize: const Size(120, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          '+1',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          aumentarPontos('NOS', 3);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7D6B7D),
                            minimumSize: const Size(120, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          '+3',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          aumentarPontos('NOS', 6);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7D6B7D),
                            minimumSize: const Size(120, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          '+6',
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Eles',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: Color(0xFF7D6B7D)),
                      ),
                      Container(
                        width: 120,
                        margin: const EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFFFFDC),
                            border: Border.all(
                                color: const Color(0xFF7D6B7D),
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            _placarEles.toString(),
                            style: const TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE22364),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => diminuirPontos('ELES'),
                        child: Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: const Color(0xFFE5E5E5),
                              border: Border.all(
                                color: const Color(0xFF707070),
                                style: BorderStyle.solid,
                              ),
                              shape: BoxShape.circle),
                          child: const Text(
                            '-1',
                            style: TextStyle(
                                fontSize: 30, color: Color(0xFF707070)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          aumentarPontos('ELES', 1);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7D6B7D),
                            minimumSize: const Size(120, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          '+1',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          aumentarPontos('ELES', 3);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7D6B7D),
                            minimumSize: const Size(120, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          '+3',
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          aumentarPontos('ELES', 6);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7D6B7D),
                            minimumSize: const Size(120, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          '+6',
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Image.asset('assets/banner-cartas.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  _vitoriaNos.toString(),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE22364)),
                ),
                const Text(
                  'Vitórias',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF7D6B7D)),
                ),
                Text(
                  _vitoriaEles.toString(),
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE22364)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          novaPartida();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          backgroundColor: const Color(0xFF7D6D7D),
                          shape: const BeveledRectangleBorder(
                              side: BorderSide(
                                  color: Color(
                                      0xFF7D6B7D))), //CircleBorder(), StadiumBorder()
                        ),
                        child: const Text(
                          'Nova Partida',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    // flex: 1,
                    child: ElevatedButton(
                        onPressed: () {
                          novoTorneio();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 10),
                          backgroundColor: const Color(0xFFE5E5E5),
                          shape: const BeveledRectangleBorder(
                              side: BorderSide(
                                  color: Color(
                                      0xFF7D6B7D))), //CircleBorder(), StadiumBorder()
                        ),
                        child: const Text(
                          'Novo Torneio',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7D6B7D)),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
