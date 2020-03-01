import 'dart:async';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/note/note_repository.dart';

class ViewNoteModel {
  factory ViewNoteModel(NoteRepository noteRepository) {
    return ViewNoteModel._(noteRepository);
  }

  ViewNoteModel._(this._noteRepository);

  final NoteRepository _noteRepository;
  Note _note;

  Note get note => _note;

  Future<bool> load(int index) async {
    _note = await _noteRepository.loadNote(index);
    return true;
  }
}
