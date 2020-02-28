import 'dart:async';

import 'package:idea_note/config/preferences_key.dart';
import 'package:idea_note/config/words.dart';
import 'package:idea_note/model/setting_title_model.dart';
import 'package:idea_note/repository/setting/setting.dart';

class SettingsModel {
  factory SettingsModel(Setting setting) {
    return SettingsModel._(setting);
  }

  SettingsModel._(this._setting);

  final Setting _setting;

  Future<void> initialize() async {
    await _setting.initialize();
  }

  Future<bool> setVersion(String version, String buildNumber) async {
    final resultVersion =
        await _setting.setValue(PreferencesKey.version, version);
    final resultBuildNumber =
        await _setting.setValue(PreferencesKey.buildNumber, buildNumber);
    return resultVersion && resultBuildNumber;
  }

  String getVersion() {
    return _setting.getValue(PreferencesKey.version) as String ?? '';
  }

  String getBuildNumber() {
    return _setting.getValue(PreferencesKey.buildNumber) as String ?? '';
  }

  Future<bool> setUpCompleted() async {
    final result = await _setting.setValue(PreferencesKey.setUpCompleted, true);
    return result;
  }

  bool isSetUpCompleted() {
    return _setting.getValue(PreferencesKey.setUpCompleted) as bool ?? false;
  }

  Future<bool> incrementNumberOfStartUps() async {
    final numberOfStartUps = getNumberOfStartUps();
    final result = await _setting.setValue(
        PreferencesKey.numberOfStartUps, numberOfStartUps + 1);
    return result;
  }

  int getNumberOfStartUps() {
    return _setting.getValue(PreferencesKey.numberOfStartUps) as int ?? 0;
  }

  Future<bool> clearWords() async {
    final resultA =
        await _setting.setValue(PreferencesKey.wordsA, Words.defaultA);
    final resultB =
        await _setting.setValue(PreferencesKey.wordsB, Words.defaultB);
    return resultA && resultB;
  }

  Future<bool> setWords(List<String> wordsA, List<String> wordsB) async {
    final resultA = await _setting.setValue(PreferencesKey.wordsA, wordsA);
    final resultB = await _setting.setValue(PreferencesKey.wordsB, wordsB);
    return resultA && resultB;
  }

  List<String> getWords(WordsType wordsType) {
    switch (wordsType) {
      case WordsType.a:
        return _setting.getValue(PreferencesKey.wordsA) as List<String> ??
            Words.defaultA;
      case WordsType.b:
        return _setting.getValue(PreferencesKey.wordsB) as List<String> ??
            Words.defaultB;
    }
    return [];
  }

  void dispose() {}
}
