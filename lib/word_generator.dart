import 'dart:math';

Random random = Random();
String getWord(List<String> words) {
  String word = words[random.nextInt(words.length)];
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
