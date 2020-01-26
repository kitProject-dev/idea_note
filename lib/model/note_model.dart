import 'dart:async';
import 'dart:math';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/storage/storage.dart';

class NoteModel {
  factory NoteModel(Storage storage) {
    return NoteModel._(storage);
  }

  NoteModel._(this._storage);

  final Storage _storage;

  Future<Note> load(int index) async {
    if (index == -1) {
      return Note(_createTitle(), '');
    }
    final note = await _storage.loadNote(index);
    return note;
  }

  String _createTitle() {
    final _wordsA = _storage.wordsA;
    final _wordsB = _storage.wordsB;
    final random = Random();
    return '${_wordsA[random.nextInt(_wordsA.length)]}'
        ' × '
        '${_wordsB[random.nextInt(_wordsB.length)]}';
  }

  void dispose() {}
}
