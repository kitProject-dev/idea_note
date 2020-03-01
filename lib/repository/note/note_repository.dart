import 'package:idea_note/entity/note.dart';

abstract class NoteRepository {
  List<String> get notes;

  Future<bool> initialize();

  Future<Note> loadNote(int index);

  Future<void> addNote(Note note);

  Future<void> removeNote(int index);

  void dispose();
}
