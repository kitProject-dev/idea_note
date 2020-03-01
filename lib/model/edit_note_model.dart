import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:idea_note/config/words.dart';
import 'package:idea_note/entity/note.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:idea_note/repository/note/note_repository.dart';

class EditNoteModel with ChangeNotifier {
  factory EditNoteModel(
      NoteRepository noteRepository, SettingsModel settingsModel) {
    return EditNoteModel._(noteRepository, settingsModel, Stopwatch());
  }

  EditNoteModel._(this._noteRepository, this._settingsModel, this._stopwatch);

  final NoteRepository _noteRepository;
  final SettingsModel _settingsModel;
  Note _note;

  final Stopwatch _stopwatch;
  String _timeStr = '00:00';
  bool _isRunning = false;
  Timer _timer;

  Note get note => _note;

  String get timeStr => _timeStr;

  bool get isRunning => _isRunning;

  Future<bool> load(int index) async {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final milliseconds = _stopwatch.elapsedMilliseconds;
      final hundreds = (milliseconds / 10).truncate();
      final seconds = (hundreds / 100).truncate();
      final minutes = (seconds / 60).truncate();
      final minutesStr = (minutes % 60).toString().padLeft(2, '0');
      final secondsStr = (seconds % 60).toString().padLeft(2, '0');
      if (minutes > 99) {
        stopTimer();
      } else {
        _timeStr = '$minutesStr:$secondsStr';
        notifyListeners();
      }
    });
    if (index == -1) {
      _note = Note(_createTitle(), '');
      notifyListeners();
      return true;
    }
    _note = await _noteRepository.loadNote(index);
    notifyListeners();
    return true;
  }

  void changeTitle() {
    _note = Note(_createTitle(), _note.content);
    notifyListeners();
  }

  void startTimer() {
    _stopwatch.start();
    _isRunning = true;
  }

  void stopTimer() {
    _isRunning = false;
    _stopwatch.stop();
  }


  String _createTitle() {
    final _wordsA = _settingsModel.getWords(WordsType.a).toList()
      ..removeWhere((item) => item.isEmpty);
    final _wordsB = _settingsModel.getWords(WordsType.b).toList()
      ..removeWhere((item) => item.isEmpty);
    final random = Random();
    return '${_wordsA[random.nextInt(_wordsA.length)]}'
        ' × '
        '${_wordsB[random.nextInt(_wordsB.length)]}';
  }

  @override
  void dispose() {
    super.dispose();
    stopTimer();
    _stopwatch.reset();
    _timer.cancel();
  }
}
