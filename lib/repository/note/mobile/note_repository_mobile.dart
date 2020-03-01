import 'dart:async';

import 'package:idea_note/repository/note/note_repository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast_io.dart';

class NoteRepositoryMobile extends NoteRepository {
  @override
  Future<bool> initialize() async {
    final directory = await getApplicationDocumentsDirectory();
    database =
        await databaseFactoryIo.openDatabase('${directory.path}/idea_note.db');
    return super.initialize();
  }
}
