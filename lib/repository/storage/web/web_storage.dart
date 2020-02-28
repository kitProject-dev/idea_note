import 'dart:async';
import 'dart:html';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/storage/storage.dart';

class WebStorage extends Storage {
  List<MapEntry<String, Note>> _notes;
  final _notesController = StreamController<List<String>>.broadcast();

  @override
  Stream<List<String>> get notes => _notesController.stream;

  @override
  Future<void> initialize() async {
    await _loadNotes();
  }

  @override
  Future<Note> loadNote(int index) async {
    return _notes[index].value;
  }

  @override
  Future<void> addNote(Note note) async {
    _notes.add(MapEntry(note.title, note));
    _notesController.sink.add(_getTitleList());
  }

  @override
  Future<void> removeNote(int index) async {
    _notes.removeAt(index);
    _notesController.sink.add(_getTitleList());
  }

  Future<void> _loadNotes() async {
    if (_notes != null) {
      return;
    }
    _notes = <MapEntry<String, Note>>[];
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
