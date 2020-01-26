import 'dart:async';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/storage/storage.dart';

class NotesModel {
  factory NotesModel(Storage storage) {
    storage.initialize();
    return NotesModel._(storage, storage.notes);
  }

  NotesModel._(this._storage, this.notesStream);

  final Storage _storage;
  final Stream<List<String>> notesStream;

  Future<void> add(Note note) async {
    await _storage.addNote(note);
  }

  Future<void> remove(int index) async {
    await _storage.removeNote(index);
  }

  void dispose() {}
}
