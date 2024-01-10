import 'package:flutter/material.dart';
import 'package:hangman/data/words.dart';
import 'package:hangman/word_generator.dart';
/*Here is the main game engine*/

class HangmanGame extends StatefulWidget {
  const HangmanGame({super.key});

  @override
  State<HangmanGame> createState() {
    return _HangmanGameState();
  }
}

class _HangmanGameState extends State<HangmanGame> {
  int wrongGuesses = 0;
  int remainingGuesses = 6;
  //Icelandic alphabet
  final List<String> _alphabet = 'AÁBDÐEÉFGHIÍJKLMNOÓPRSTUÚVXYÝÞÆÖ'.split('');
  Set<String> _chosenCharacter = {};
  List<String> _wrongCharacter = [];
  //Here we fetch and hide the word, from the word generator functions.
  late String hangmanWord = getWord(wordList);
  late List hiddenWord = hideWord(hangmanWord);

  //This is the restart function so you can play again without reloading the app
  void onRestartGame() {
    setState(() {
      hangmanWord = getWord(wordList);
      hiddenWord = hideWord(hangmanWord);
      _chosenCharacter = {};
      _wrongCharacter = [];
      wrongGuesses = 0;
      remainingGuesses = 6;
    });
  }

  //Here is the game logic to see if the chosen character is in the word.
  //if it is then it goes to the right place and is visible for the player
  //And if it is wrong player loses one life and then hangmen graphic updates.
  void _onCharTap(String char) {
    setState(() {
      _chosenCharacter.add(char.toUpperCase());

      if (hangmanWord.contains(char.toUpperCase())) {
        for (int i = 0; i < hangmanWord.length; i++) {
          if (hangmanWord[i] == char) {
            hiddenWord[i] = char;
          }
        }
      } else {
        wrongGuesses++;
        remainingGuesses--;
        _wrongCharacter.add(char.toUpperCase());
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    //Here is the defenition of the lose conditions and
    //lose message, with the correct word and restart button 
    if (wrongGuesses == 6) {
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: Colors.red,
              title: const Text('Tapaðir :('),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/loser.jpg',
                    width: 250,
                  ),
                  const SizedBox(height: 20,),
                  Text('Rétt orð: $hangmanWord'),
                ],
              ),
              actions: <Widget>[
               Center(
                 child: OutlinedButton(
                    child: const Text(
                      'Aftur',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      onRestartGame();
                    },
                  ),
               ),
              ],
            );
          },
        );
      });
    }

    //Defining the win condition and win message 
    //with the restart option.
    if (hiddenWord.join('').toUpperCase() == hangmanWord.toUpperCase()) {
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              alignment: Alignment.center,
              backgroundColor: const Color.fromARGB(224, 249, 241, 27),
              title: const Text(
                'All I do is Win Win Win',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              content: Image.asset(
                'assets/images/winner.png',
                width: 250,
              ),
              actions: <Widget>[
                Center(
                  child: OutlinedButton(
                    child: const Text(
                      'Aftur',
                      style: TextStyle(fontSize: 24, color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      onRestartGame();
                    },
                  ),
                ),
              ],
            );
          },
        );
      });
    }
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          //Game graphic that updates with wrong guesses until player hangs.
          Image.asset(
            'assets/images/hangman-$wrongGuesses.png',
            width: 400,
          ),
          const SizedBox(height: 10),
          Text(
            hiddenWord.join(' '),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          //Here is the on screen keyboard, with Icelandic characters.
          GridView.count(
            crossAxisCount: 8,
            shrinkWrap: true,
            children: _alphabet.map((char) {
              final bool isUsed = _chosenCharacter.contains(char);
              return GestureDetector(
                onTap: isUsed ? null : () => _onCharTap(char),
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: isUsed
                    //the button changes color after use.
                        ? const Color.fromARGB(255, 250, 5, 5)
                        : const Color.fromARGB(255, 164, 164, 164),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Center(
                    child: Text(
                      char,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              //Here is where to keep track of wrong characters used
              Text(
                'Rangir Stafir:${_wrongCharacter.join(', ')}',
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              //Remaining attempts until loss
              Text(
                '$remainingGuesses Líf eftir',
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}





/*

import 'dart:math';

import 'package:flutter/material.dart';
import 'data/words.dart';
import 'package:hangman/on_screen_keyboard.dart';

class Hangman extends StatefulWidget {
  const Hangman({super.key});
  

  @override
  State<StatefulWidget> createState() {
    return _HangmanState();
  }
}

class _HangmanState extends State<Hangman> {
  int wrongGuesses = 0;

  String getWord(List<String> listOfWords) {
    final random = Random();
    String word = listOfWords[random.nextInt(wordList.length)];
    return word;
  }

  String hideWord(String word) {
    int wordLength = word.length;
    String hiddenWord = '';
    for (int i = 0; i < wordLength; i++) {
      hiddenWord = '_ ' * wordLength;
    }
    return hiddenWord;
  }

  @override
  Widget build(BuildContext context) {
    String word = getWord(wordList);
    hideWord(word);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hangman'),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/hangman-$numberOfGuesses',
            width: 200,
          ),
          const SizedBox(height: 20),
          Text(word),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
*/