import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/storage/storage.dart';

class NoteModel with ChangeNotifier {
  factory NoteModel(Storage storage) {
    return NoteModel._(storage);
  }

  NoteModel._(this._storage);

  final Storage _storage;
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
    final _wordsA = _storage.wordsA;
    final _wordsB = _storage.wordsB;
    final random = Random();
    return '${_wordsA[random.nextInt(_wordsA.length)]}'
        ' × '
        '${_wordsB[random.nextInt(_wordsB.length)]}';
  }
}
