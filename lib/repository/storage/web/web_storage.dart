import 'dart:async';
import 'dart:html';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/storage/storage.dart';

class WebStorage extends Storage {
  final List<MapEntry<String, Note>> _noteList = <MapEntry<String, Note>>[];
  final _noteListController = StreamController<List<String>>.broadcast();

  @override
  Stream<List<String>> get noteList => _noteListController.stream;

  @override
  Future<void> loadList() async {
    _noteListController.sink.add(_getTitleList());
  }

  @override
  Future<Note> loadNote(int index) async {
    if (index == -1) {
      return Note('', '');
    }
    return _noteList[index].value;
  }

  @override
  Future<void> addNote(Note note) async {
    note.title = '新規ノート${_noteList.length}';
    _noteList.add(MapEntry(note.title, note));
    _noteListController.sink.add(_getTitleList());
  }

  @override
  Future<void> removeNote(int index) async {
    _noteList.removeAt(index);
    _noteListController.sink.add(_getTitleList());
  }

  List<String> _getTitleList() {
    return _noteList.map((f) => f.key).toList();
  }

  @override
  void dispose() {
    _noteListController.close();
  }
}
