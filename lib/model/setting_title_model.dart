import 'package:idea_note/config/words.dart';

class SettingTitleModel {
  factory SettingTitleModel() {
    return SettingTitleModel._();
  }

  SettingTitleModel._();

  List<String> getWords(WordsType wordsType) {
    switch (wordsType) {
      case WordsType.a:
        return _wordsA;
      case WordsType.b:
        return _wordsB;
    }
    return [];
  }

  void setWords(WordsType wordsType, List<String> words) {
    switch (wordsType) {
      case WordsType.a:
        _wordsA = words;
        break;
      case WordsType.b:
        _wordsB = words;
        break;
    }
  }

  List<String> _wordsA = Words.defaultA;
  List<String> _wordsB = Words.defaultB;
}

enum WordsType { a, b }
