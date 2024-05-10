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
  final Color black = Colors.black12;
  final Color white = Colors.white70;
  final Color? grey = Colors.grey[800];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: black,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            //titulo
            'JOGO DA VELHA',
            style: TextStyle(color: white),
          ),
          backgroundColor: black,
        ),
        body: Column(
          children: [
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
                    if (trayGame.cardHouse[index] == TypeHouse.empty) {
                    setState(() {
                      trayGame.markHouse(index);
                      trayGame.passTurn();
                    });
                    }
                  },
                  child: Card(
                    color: grey,
                    child: Center(
                      child: Text(
                        trayGame.cardHouse[index].name,
                        style: TextStyle(color: white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}