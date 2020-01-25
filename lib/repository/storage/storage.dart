import 'package:idea_note/entity/note.dart';

abstract class Storage {
  Stream<List<String>> get noteList;

  Future<void> loadList();

  Future<Note> loadNote(int index);

  Future<void> addNote(Note note);

  Future<void> removeNote(int index);

  void dispose();
}
