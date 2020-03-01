import 'dart:async';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/note/note_repository.dart';

class TestNoteRepository extends NoteRepository {
  final List<MapEntry<String, Note>> _notes = <MapEntry<String, Note>>[];
  final _notesController = StreamController<List<String>>.broadcast();

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
    _notesController.sink.add(_getTitleList());
    return true;
  }

  @override
  Future<Note> loadNote(int index) async {
    if (index == -1) {
      return Note('', '');
    }
    return _notes[index].value;
  }

  @override
  Future<void> addNote(Note note) async {
    note.title = '新規ノート${_notes.length}';
    _notes.add(MapEntry(note.title, note));
    _notesController.sink.add(_getTitleList());
  }

  @override
  Future<void> removeNote(int index) async {
    _notes.removeAt(index);
    _notesController.sink.add(_getTitleList());
  }

  List<String> _getTitleList() {
    return _notes.map((f) => f.key).toList();
  }

  @override
  void dispose() {
    _notesController.close();
  }
}
