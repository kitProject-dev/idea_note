import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/note/note_repository.dart';
import 'package:path_provider/path_provider.dart';

class NoteRepositoryMobile extends NoteRepository {
  List<String> _notes;

  @override
  List<String> get notes => _notes.toList() ?? [];

  @override
  Future<bool> initialize() async {
    await _loadNotes();
    return true;
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
  }

  @override
  Future<void> removeNote(int index) async {
    final notesDirectory = await _notesDirectory;
    final noteFile = File('${notesDirectory.path}/${_notes[index]}');
    await noteFile.delete();
    _notes.removeAt(index);
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
    _notes = <String>[];
    noteList.map((f) => f.path.split('/').last).forEach((name) {
      _notes.add(name);
    });
  }

  Future<Directory> get _notesDirectory async {
    final directory = await getApplicationDocumentsDirectory();
    final notesDirectory = Directory('${directory.path}/notes');
    await notesDirectory.create();
    return notesDirectory;
  }

  @override
  void dispose() {}
}
