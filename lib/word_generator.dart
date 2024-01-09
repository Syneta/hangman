import 'dart:math';

Random random = Random();
String getWord(List<String> words) {
  String word = words[random.nextInt(words.length)];
  return word;
}

List<String> hideWord(String word) {
  List<String> hiddenWord = ('_ ' * word.length).split(' ');
  return hiddenWord;
}
