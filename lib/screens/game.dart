import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({super.key, required this.title});

  final String title;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text('sexo', style: Theme.of(context).textTheme.headlineMedium),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(
                context,
                '/'
              );
            }, child: Text('Jogar Novamente'))
          ],
        ),
      ),
      //Essa seção adiciona objetos floating
    );
  }
}
