import 'dart:async';

import 'package:idea_note/config/preferences_key.dart';
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

  void dispose() {}
}
