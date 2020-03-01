import 'package:flutter/cupertino.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/repository/note/note_repository.dart';

class HomeModel with ChangeNotifier {
  factory HomeModel(NoteRepository noteRepository) {
    return HomeModel._(noteRepository);
  }

  HomeModel._(this._noteRepository);

  final NoteRepository _noteRepository;

  List<String> get notes => _noteRepository.notes;

  Future<void> addNote(Note note) async {
    await _noteRepository.addNote(note);
    notifyListeners();
  }

  Future<void> removeNote(int index) async {
    await _noteRepository.removeNote(index);
    notifyListeners();
  }
}
