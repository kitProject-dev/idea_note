import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/storage/storage.dart';
import 'package:path_provider/path_provider.dart';

class MobileStorage extends Storage {
  List<String> _notes;
  final _notesController = StreamController<List<String>>.broadcast();

  @override
  Stream<List<String>> get notes => _notesController.stream;

  @override
  Future<void> initialize() async {
    await super.initialize();
    await _loadNotes();
  }

  @override
  Future<Note> loadNote(int index) async {
    final notesDirectory = await _notesDirectory;
    final noteFile = File('${notesDirectory.path}/${_notes[index]}');
    final jsonStr = await noteFile.readAsString();
    return Note.fromJson(jsonDecode(jsonStr) as Map<String, dynamic>);
  }

  @override
  Future<void> addNote(Note note) async {
    final notesDirectory = await _notesDirectory;
    final noteFile = File('${notesDirectory.path}/${note.title}');
    await noteFile.writeAsString(jsonEncode(note.toJson()));
    _notes.add(note.title);
    _notesController.sink.add(_notes);
  }

  @override
  Future<void> removeNote(int index) async {
    final notesDirectory = await _notesDirectory;
    final noteFile = File('${notesDirectory.path}/${_notes[index]}');
    await noteFile.delete();
    _notes.removeAt(index);
    _notesController.sink.add(_notes);
  }

  @override
  void dispose() {
    _notesController.close();
  }

  Future<void> _loadNotes() async {
    if (_notes != null) {
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
    _notes = noteList.map((f) => f.path.split('/').last) as List<String>;
    _notesController.sink.add(_notes);
  }

  Future<Directory> get _notesDirectory async {
    final directory = await getApplicationDocumentsDirectory();
    final notesDirectory = Directory('${directory.path}/notes');
    await notesDirectory.create();
    return notesDirectory;
  }
}
