import 'package:flutter/material.dart';
import 'package:jogo_da_velha/pages/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: HomePage(),
    );
  }
}