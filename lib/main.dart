import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jokenpoh/screens/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      routes: {
        '/': (context) => const MyHomePage(title: "Pedra, Papel, Tesoura"),
        '/final': (context) => const Game(title: "Pedra, Papel, Tesoura")
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var options = ['assets/icons/pedra.png', 'assets/icons/papel.png', 'assets/icons/tesoura.png'];

  void handleChoice(int playerEscolha) {
    Navigator.pushNamed(context, "/final", arguments: {
      "playerChoice": playerEscolha,
      "agentChoice": Random().nextInt(3)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: [
                Image.asset('assets/icons/padrao.png', width: 200),
                const Text(
                  'Escolha do app (aleatório)',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => handleChoice(0),
                      child: Image.asset(options[0], width: 100),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => handleChoice(1),
                      child: Image.asset(options[1], width: 100),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => handleChoice(2),
                      child: Image.asset(options[2], width: 100),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Escolha do usuário',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}