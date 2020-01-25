import 'dart:async';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/storage/storage.dart';

class NotesModel {
  factory NotesModel(Storage storage) {
    storage.loadList();
    return NotesModel._(storage, storage.noteList);
  }

  NotesModel._(this._storage, this.noteStream);

  final Storage _storage;
  final Stream<List<String>> noteStream;

  Future<void> add(Note note) async {
    await _storage.addNote(note);
  }

  Future<void> remove(int index) async {
    await _storage.removeNote(index);
  }

  void dispose() {}
}
