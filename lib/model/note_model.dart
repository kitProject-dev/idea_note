import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/model/setting_title_model.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:idea_note/repository/storage/storage.dart';

class NoteModel with ChangeNotifier {
  factory NoteModel(Storage storage, SettingsModel settingsModel) {
    return NoteModel._(storage, settingsModel);
  }

  NoteModel._(this._storage, this._settingsModel);

  final Storage _storage;
  final SettingsModel _settingsModel;
  Note _note;

  Note get note => _note;

  Future<bool> load(int index) async {
    if (index == -1) {
      _note = Note(_createTitle(), '');
      notifyListeners();
      return true;
    }
    _note = await _storage.loadNote(index);
    notifyListeners();
    return true;
  }

  void changeTitle() {
    _note = Note(_createTitle(), _note.content);
    notifyListeners();
  }

  String _createTitle() {
    final _wordsA = _settingsModel.getWords(WordsType.a).toList()
      ..removeWhere((item) => item.isEmpty);
    final _wordsB = _settingsModel.getWords(WordsType.b).toList()
      ..removeWhere((item) => item.isEmpty);
    final random = Random();
    return '${_wordsA[random.nextInt(_wordsA.length)]}'
        ' × '
        '${_wordsB[random.nextInt(_wordsB.length)]}';
  }
}
