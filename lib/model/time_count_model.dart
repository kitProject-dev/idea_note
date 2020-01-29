import 'dart:async';

import 'package:flutter/foundation.dart';

class TimeCountModel with ChangeNotifier {
  factory TimeCountModel() {
    return TimeCountModel._(Stopwatch());
  }

  TimeCountModel._(this._stopwatch);

  final Stopwatch _stopwatch;
  String _timeStr = '00:00';
  bool _isRunning = false;
  Timer _timer;

  String get timeStr => _timeStr;

  bool get isRunning => _isRunning;

  void create() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final milliseconds = _stopwatch.elapsedMilliseconds;
      final hundreds = (milliseconds / 10).truncate();
      final seconds = (hundreds / 100).truncate();
      final minutes = (seconds / 60).truncate();
      final minutesStr = (minutes % 60).toString().padLeft(2, '0');
      final secondsStr = (seconds % 60).toString().padLeft(2, '0');
      if (minutes > 99) {
        stop();
      } else {
        _timeStr = '$minutesStr:$secondsStr';
        notifyListeners();
      }
    });
  }

  void start() {
    _stopwatch.start();
    _isRunning = true;
  }

  void stop() {
    _isRunning = false;
    _stopwatch.stop();
  }

  @override
  void dispose() {
    super.dispose();
    stop();
    _stopwatch.reset();
    _timer.cancel();
  }
}
