import 'dart:async';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/storage/storage.dart';

class TestStorage extends Storage {
  final List<MapEntry<String, Note>> _notes = <MapEntry<String, Note>>[];
  final _notesController = StreamController<List<String>>.broadcast();

  @override
  Stream<List<String>> get notes => _notesController.stream;

  @override
  Future<void> initialize() async {
    _notesController.sink.add(_getTitleList());
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
