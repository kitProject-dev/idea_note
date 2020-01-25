import 'dart:async';

import 'package:idea_note/entity/note.dart';
import 'package:idea_note/model/notes_model.dart';
import 'package:idea_note/repository/storage/storage.dart';

class NoteBloc {
  factory NoteBloc(Storage storage) {
    final noteModel = NotesModel(storage);
    // ignore: close_sinks
    final addController = StreamController<Note>(sync: true);
    // ignore: close_sinks
    final removeController = StreamController<int>(sync: true);

    final subscriptions = <StreamSubscription<dynamic>>[
      addController.stream.listen(noteModel.add),
      removeController.stream.listen(noteModel.remove),
    ];
    return NoteBloc._(addController, removeController, noteModel.noteStream,
        noteModel, subscriptions);
  }

  NoteBloc._(this.addNote, this.removeNote, this.noteStream, this._noteModel,
      this._subscriptions);

  final Sink<Note> addNote;
  final Sink<int> removeNote;
  final Stream<List<String>> noteStream;
  final NotesModel _noteModel;
  final List<StreamSubscription<dynamic>> _subscriptions;

  void dispose() {
    addNote.close();
    removeNote.close();
    for (dynamic subscription in _subscriptions) {
      subscription.cancel();
    }
    _noteModel.dispose();
  }
}
