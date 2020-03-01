import 'dart:async';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/note/note_repository.dart';

class NoteRepositoryWeb extends NoteRepository {
  List<MapEntry<String, Note>> _notes;

  @override
  List<String> get notes {
    if (_notes != null) {
      return _notes.map((f) => f.key).toList();
    } else {
      return [];
    }
  }

  @override
  Future<bool> initialize() async {
    await _loadNotes();
    return true;
  }

  @override
  Future<Note> loadNote(int index) async {
    return _notes[index].value;
  }

  @override
  Future<void> addNote(Note note) async {
    _notes.add(MapEntry(note.title, note));
  }

  @override
  Future<void> removeNote(int index) async {
    _notes.removeAt(index);
  }

  Future<void> _loadNotes() async {
    if (_notes != null) {
      return;
    }
    _notes = <MapEntry<String, Note>>[];
  }

  @override
  void dispose() {}
}
