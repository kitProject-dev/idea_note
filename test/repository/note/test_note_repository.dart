import 'dart:async';

import 'package:idea_note/repository/note/note_repository.dart';
import 'package:sembast/sembast_io.dart';

class TestNoteRepository extends NoteRepository {
  @override
  Future<bool> initialize() async {
    database = await databaseFactoryIo.openDatabase('idea_note.db');
    return super.initialize();
  }
}
