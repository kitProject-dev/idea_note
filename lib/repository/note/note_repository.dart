import 'dart:async';

import 'package:idea_note/entity/note.dart';
import 'package:sembast/sembast.dart';

class NoteRepository {
  List<MapEntry<int, String>> _notes;
  Database database;
  StoreRef _store;

  List<String> get notes {
    if (_notes != null) {
      return _notes.map((f) => f.value).toList();
    } else {
      return [];
    }
  }

  Future<bool> initialize() async {
    _store = intMapStoreFactory.store('notes');
    await _loadNotes();
    return true;
  }

  Future<Note> loadNote(int index) async {
    final json = await _store.record(_notes[index].key).get(database)
        as Map<String, dynamic>;
    return Note.fromJson(json);
  }

  Future<void> addNote(Note note) async {
    final key = await _store.add(database, note.toJson()) as int;
    _notes.add(MapEntry(key, note.title));
  }

  Future<void> removeNote(int index) async {
    await _store.record(_notes[index].key).delete(database);
    _notes.removeAt(index);
  }

  Future<void> _loadNotes() async {
    if (_notes != null) {
      return;
    }
    _notes = [];
    final notes = await _store.query().getSnapshots(database);
    for (var note in notes) {
      _notes.add(MapEntry(note.key as int,
          Note.fromJson(note.value as Map<String, Object>).title));
    }
  }

  Future<void> dispose() async {
    await database.close();
  }
}
