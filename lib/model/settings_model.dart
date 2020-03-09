import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:idea_note/config/preferences_key.dart';
import 'package:idea_note/config/words.dart';
import 'package:idea_note/repository/setting/setting_repository.dart';

class SettingsModel with ChangeNotifier {
  factory SettingsModel(SettingRepository settingRepository) {
    return SettingsModel._(settingRepository);
  }

  SettingsModel._(this._settingRepository);

  final SettingRepository _settingRepository;

  Future<void> initialize() async {
    await _settingRepository.initialize();
  }

  Future<bool> setVersion(String version, int buildNumber) async {
    final resultVersion =
        await _settingRepository.setValue(PreferencesKey.version, version);
    final resultBuildNumber = await _settingRepository.setValue(
        PreferencesKey.buildNumber, buildNumber);
    notifyListeners();
    return resultVersion && resultBuildNumber;
  }

  String getVersion() {
    return _settingRepository.getValue(PreferencesKey.version) as String ?? '';
  }

  int getBuildNumber() {
    return _settingRepository.getValue(PreferencesKey.buildNumber) as int ?? -1;
  }

  Future<bool> setUpCompleted() async {
    final result =
        await _settingRepository.setValue(PreferencesKey.setUpCompleted, true);
    notifyListeners();
    return result;
  }

  bool isSetUpCompleted() {
    return _settingRepository.getValue(PreferencesKey.setUpCompleted) as bool ??
        false;
  }

  Future<bool> incrementNumberOfStartUps() async {
    final numberOfStartUps = getNumberOfStartUps();
    final result = await _settingRepository.setValue(
        PreferencesKey.numberOfStartUps, numberOfStartUps + 1);
    notifyListeners();
    return result;
  }

  int getNumberOfStartUps() {
    return _settingRepository.getValue(PreferencesKey.numberOfStartUps)
            as int ??
        0;
  }

  Future<bool> clearWords() async {
    final resultA = await _settingRepository.setValue(
        PreferencesKey.wordsA, Words.defaultA);
    final resultB = await _settingRepository.setValue(
        PreferencesKey.wordsB, Words.defaultB);
    notifyListeners();
    return resultA && resultB;
  }

  Future<bool> setWords(List<String> wordsA, List<String> wordsB) async {
    final resultA =
        await _settingRepository.setValue(PreferencesKey.wordsA, wordsA);
    final resultB =
        await _settingRepository.setValue(PreferencesKey.wordsB, wordsB);
    notifyListeners();
    return resultA && resultB;
  }

  List<String> getWords(WordsType wordsType) {
    switch (wordsType) {
      case WordsType.a:
        final wordsA = _settingRepository.getValue(PreferencesKey.wordsA);
        if (wordsA != null) {
          return wordsA.cast<String>().toList() as List<String>;
        } else {
          return Words.defaultA;
        }
        break;
      case WordsType.b:
        final wordsB = _settingRepository.getValue(PreferencesKey.wordsB);
        if (wordsB != null) {
          return wordsB.cast<String>().toList() as List<String>;
        } else {
          return Words.defaultB;
        }
        break;
    }
    return [];
  }
}
