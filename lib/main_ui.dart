import 'package:flutter/material.dart';
import 'package:hangman/hangman.dart';
import 'package:hangman/on_screen_keyboard.dart';

class MainUi extends StatelessWidget {
  MainUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hangman'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/hangman-0',
            width: 200,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
