import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({required this.startGame, super.key});

  final void Function() startGame;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/hangman-3.png',
            width: 150,
          ),
          const SizedBox(height: 25),
          const Text('Velkominn í hengimann, gangi þér vel'),
          const SizedBox(height: 25),
          OutlinedButton(
            onPressed: startGame,
            child: const Text('Spila Leik'),
          ),
        ],
      ),
    );
  }
}
