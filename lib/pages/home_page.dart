// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:jogo_da_velha/widgets/tray_game.dart';
import 'package:jogo_da_velha/widgets/type_house.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TrayGame trayGame = TrayGame();

  //cores
  final Color black = Colors.black;
  final Color white = Colors.white;
  final Color green = Colors.green;
  final Color? grey = Colors.grey[800];

  //começar o primeiro carregamento de tela com as casas limpas
  String firstLoad(int index) {
    if (trayGame.cardHouse[index].name == 'empty') {
      return '';
    } else {
      return trayGame.cardHouse[index].name;
    }
  }

  void clearHouse() {
    setState(() {
      for (var i = 0; i < 9; i++) {
        trayGame.cardHouse[i] = TypeHouse.empty;
      }
      winner = false;
      gameOver = false;
    });
  }

  bool winner = false;
  bool gameOver = false;

  @override
  Widget build(BuildContext context) {
    //media query
    final height = MediaQuery.sizeOf(context).height * 0.1;
    final width = MediaQuery.sizeOf(context).width * 0.8;

    if (trayGame.checkWin) {
      winner = true;
    }

    if (!trayGame.cardHouse.contains(TypeHouse.empty) && winner != true) {
      gameOver = true;
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            //titulo
            'JOGO DA VELHA',
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          backgroundColor: black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Jogador 1 \nX',
                  style: TextStyle(
                      color: white, fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Jogador 2 \nO',
                  style: TextStyle(
                      color: white, fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Align(
              child: Text(
                'Agora é a vez do ${trayGame.currentTurn == TypeHouse.O ? 'X' : 'O'}',
                style: TextStyle(
                    color: white, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              // tabuleiro
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    //OnTap para definir o que acontecera quando clicar
                    if (winner) {
                      return;
                    }
                    if (trayGame.cardHouse[index] == TypeHouse.empty) {
                      setState(() {
                        trayGame.passTurn();
                        trayGame.markHouse(index);
                      });
                    }
                  },
                  child: Card(
                    color: trayGame.winColor.contains(index.toString()) &&
                            winner == true
                        ? green
                        : grey,
                    child: Center(
                      child: Text(
                        firstLoad(index),
                        style: TextStyle(color: white, fontSize: 50),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 10), //espaçamento
            if (winner)
              Text(
                "O ganhador é ${trayGame.currentTurn == TypeHouse.X ? 'X' : 'O'}",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            else if (gameOver)
              const Text(
                "Ninguém ganhou!!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )
            else
              const Text('',
                  style: TextStyle(color: Colors.transparent, fontSize: 30)),
            Container(
              //botão para apagar os itens na tela
              color: Colors.transparent,
              height: height,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                    onPressed: clearHouse,
                    icon: const Icon(
                      Icons.replay_outlined,
                      size: 40,
                    ),
                    label: const Text(
                      'REINICIAR',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
