import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:idea_note/entity/note.dart';

abstract class Storage {
  List<String> _wordsA;
  List<String> _wordsB;

  List<String> get wordsA => _wordsA;

  List<String> get wordsB => _wordsB;

  Stream<List<String>> get notes;

  Future<void> initialize() async {
    await _words();
  }

  Future<Note> loadNote(int index);

  Future<void> addNote(Note note);

  Future<void> removeNote(int index);

  void dispose();

  Future<void> _words() async {
    if (_wordsA != null && _wordsB != null) {
      return;
    }
    final loadData = await rootBundle.loadString('assets/json/words.json');
    _wordsA = <String>[]..addAll(
        (json.decode(loadData)['words_a'] as List<dynamic>).cast<String>());
    _wordsB = <String>[]..addAll(
        (json.decode(loadData)['words_b'] as List<dynamic>).cast<String>());
  }
}
