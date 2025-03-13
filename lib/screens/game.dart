import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key, required this.title});

  final String title;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {

  var options = ['assets/icons/pedra.png', 'assets/icons/papel.png', 'assets/icons/tesoura.png'];
  var conditions = ['assets/icons/icons8-aperto-de-maos-100.png', 'assets/icons/icons8-perder-48.png', 'assets/icons/icons8-vitória-48.png'];

  int gameCondition(int playerChoice, int agentChoice) {
    if (playerChoice == agentChoice) {
      return 0;
    } else if (playerChoice == 1 && agentChoice == 0) {
      return 2;
    } else if (playerChoice == 0 && agentChoice == 2) {
      return 2;
    } else if (playerChoice == 2 && agentChoice == 1) {
      return 2;
    } else {
      return 1;
    }
  }

  String finalText(int gameCondition) {
    if (gameCondition == 2) {
      return 'Você Ganhou!';
    }
    return 'Você Perdeu!';
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    int gameFinal = gameCondition(args['playerChoice'], args['agentChoice']);
    String finalString = finalText(gameFinal);

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
                Image.asset(options[args['agentChoice']], width: 200),
                const Text(
                  'Escolha do app',
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
                Image.asset(options[args['playerChoice']], width: 200),
                const Text(
                  'Sua escolha',
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
                Image.asset(conditions[gameFinal], width: 200),
                Text(
                  finalString,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                ElevatedButton(onPressed: () => Navigator.pop(context),
                    child: Text("Jogar Novamente"),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
