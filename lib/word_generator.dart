import 'dart:math';


/*
Here we take a random word from the wordlist
*/
Random random = Random();
String getWord(List<String> words) {
  String word = words[random.nextInt(words.length)];
  return word;
}

/*
Here we hide the word and 
show the player how many letters the word is
*/
List<String> hideWord(String word) {
  List<String> hiddenWord = ('_ ' * word.length).split(' ');
  return hiddenWord;
}
