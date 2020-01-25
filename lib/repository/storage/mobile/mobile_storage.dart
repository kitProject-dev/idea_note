import 'dart:async';
import 'dart:io';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/storage/storage.dart';
import 'package:path_provider/path_provider.dart';

class MobileStorage extends Storage {
  final List<String> _noteList = <String>[];
  final _noteListController = StreamController<List<String>>.broadcast();

  @override
  Stream<List<String>> get noteList => _noteListController.stream;

  @override
  Future<void> loadList() async {
    if (_noteList.isNotEmpty) {
      return;
    }
    final notesDirectory = await _notesDirectory;
    final contents = notesDirectory.listSync();
    final noteList = <File>[];
    for (var fileOrDir in contents) {
      if (fileOrDir is File) {
        noteList.add(fileOrDir);
      }
    }
    noteList
        .sort((a, b) => a.lastModifiedSync().compareTo(b.lastModifiedSync()));
    _noteList.addAll(noteList.map((f) => f.path.split('/').last));
    _noteListController.sink.add(_noteList);
  }

  @override
  Future<Note> loadNote(int index) async {
    if (index == -1) {
      return Note('', '');
    }
    final notesDirectory = await _notesDirectory;
    final noteFile = File('${notesDirectory.path}/${_noteList[index]}');
    final contents = await noteFile.readAsString();
    return Note(_noteList[index], contents);
  }

  @override
  Future<void> addNote(Note note) async {
    note.title = '新規ノート${_noteList.length}';
    final notesDirectory = await _notesDirectory;
    final noteFile = File('${notesDirectory.path}/${note.title}');
    await noteFile.writeAsString(note.content);
    _noteList.add(note.title);
    _noteListController.sink.add(_noteList);
  }

  @override
  Future<void> removeNote(int index) async {
    final notesDirectory = await _notesDirectory;
    final noteFile = File('${notesDirectory.path}/${_noteList[index]}');
    await noteFile.delete();
    _noteList.removeAt(index);
    _noteListController.sink.add(_noteList);
  }

  Future<Directory> get _notesDirectory async {
    final directory = await getApplicationDocumentsDirectory();
    final notesDirectory = Directory('${directory.path}/notes');
    await notesDirectory.create();
    return notesDirectory;
  }

  @override
  void dispose() {
    _noteListController.close();
  }
}
