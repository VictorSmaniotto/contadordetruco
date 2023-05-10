import 'package:flutter/material.dart';

class VitoriaPage extends StatelessWidget {
  final String grupo;
  const VitoriaPage({super.key, required this.grupo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Vitória!'),
        backgroundColor: const Color(0xFF7D6B7D),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context, 'desfazer');
            },
            child: const Icon(Icons.undo)),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Parabéns!',
                style: TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text('Vitória do Grupo $grupo',
                  style: const TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                'assets/trofeu.png',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'novaPartida');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7D6B7D),
                  ),
                  child: const Text(
                    'Nova Partida',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
