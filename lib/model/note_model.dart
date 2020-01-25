import 'dart:async';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/storage/storage.dart';

class NoteModel {
  factory NoteModel(Storage storage) {
    return NoteModel._(storage);
  }

  NoteModel._(this._storage);

  final Storage _storage;

  Future<Note> load(int index) async {
    final note = await _storage.loadNote(index);
    return note;
  }

  void dispose() {}
}
