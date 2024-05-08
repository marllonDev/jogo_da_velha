// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            'Jogo da Velha',
            style: TextStyle(color: white),
          ),
          backgroundColor: black,
        ),
        body: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    color: grey,
                    child: Center(
                      child: Text(
                        'X',
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