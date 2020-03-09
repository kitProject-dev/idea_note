import 'dart:async';

import 'package:flutter/material.dart';
import 'package:idea_note/config/assets.dart';
import 'package:idea_note/config/config.dart';
import 'package:idea_note/config/route.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:idea_note/repository/note/note_repository.dart';
import 'package:package_info_wrapper/package_info_wrapper.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  Timer _timer;
  final Duration splashTimeDuration = const Duration(seconds: 2);
  bool _isLoadFinished = false;
  bool _isSplashTimeEnds = false;

  @override
  void initState() {
    _timer = Timer(splashTimeDuration, () {
      _isSplashTimeEnds = true;
      _openScreen();
    });
    _loading().then((_) {
      _isLoadFinished = true;
      _openScreen();
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(Assets.splash),
      ),
    );
  }

  Future<void> _loading() async {
    final settingsModel = Provider.of<SettingsModel>(context, listen: false);
    await settingsModel.initialize();
    final packageInfo = await PackageInfoWrapper.fromPlatform();
    await _upgradeApp(settingsModel.getBuildNumber(), packageInfo.buildNumber);
    await settingsModel.setVersion(
        packageInfo.version, packageInfo.buildNumber);
    await settingsModel.incrementNumberOfStartUps();
  }

  Future<void> _upgradeApp(num oldVersion, int newVersion) async {
    final noteRepository = Provider.of<NoteRepository>(context, listen: false);
    await noteRepository.initialize(
        Config.dbVersion, (db, oldVersion, newVersion) {});
  }

  void _openScreen() {
    final settingsModel = Provider.of<SettingsModel>(context, listen: false);
    if (!_isLoadFinished || !_isSplashTimeEnds) {
      return;
    }
    if (settingsModel.getNumberOfStartUps() > 0 &&
        settingsModel.isSetUpCompleted()) {
      Navigator.of(context).pushReplacementNamed(RoutePath.home);
    } else {
      Navigator.of(context).pushReplacementNamed(RoutePath.tutorial);
    }
  }
}
