import 'dart:async';

import 'package:idea_note/repository/note/note_repository.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

class NoteRepositoryWeb extends NoteRepository {
  @override
  Future<bool> initialize(
      int version, OnVersionChangedFunction onVersionChanged) async {
    database = await databaseFactoryWeb.openDatabase('idea_note',
        version: version, onVersionChanged: onVersionChanged);
    return super.initialize(version, onVersionChanged);
  }
}
