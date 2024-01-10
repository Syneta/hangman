import 'package:flutter/material.dart';
/*
This is the opening screen with a start game button and
 the rules for the game.
*/
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({required this.startGame, super.key});
  final void Function() startGame;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'assets/images/hangman-6.png',
            width: 400,
          ),
          const SizedBox(height: 25),
          const Text(
            'Velkomin í hengimann, gangi þér vel',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 25),
          OutlinedButton(
            onPressed: () {
              startGame();
            },
            child: const Text(
              'Spila Leik',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              'Leikreglur:\nLeikurinn snýst um það að finna rétta orðið. Þú giskar á einn staf í einu. Ef þú færð réttan staf þá birtist hann á réttum stað í orðinu. Ef þú giskar á rangan staf birtist hann á lista yfir stafi sem þú hefur giskað á en eru ekki í orðinu. Eftir sex rangar tilraunir er leik lokið.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
