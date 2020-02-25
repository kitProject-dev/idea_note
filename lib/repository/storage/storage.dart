import 'package:idea_note/entity/note.dart';

abstract class Storage {
  Stream<List<String>> get notes;

  Future<void> initialize();

  Future<Note> loadNote(int index);

  Future<void> addNote(Note note);

  Future<void> removeNote(int index);

  void dispose();
}
