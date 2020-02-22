import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:idea_note/config/assets.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:idea_note/route.dart';
import 'package:package_info_wrapper/package_info_wrapper.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  bool _isSetUpCompleted = false;
  bool _isLoadFinished = false;
  bool _isSplashTimeEnds = false;
  int _numberOfStartUps = 0;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      _isSplashTimeEnds = true;
      _openScreen();
    });
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  Future<void> _loading() async {
    final settingsModel = Provider.of<SettingsModel>(context, listen: false);
    await settingsModel.initialize();
    final packageInfo = await PackageInfoWrapper.fromPlatform();
    await settingsModel.setVersion(
        packageInfo.version, packageInfo.buildNumber);
    _numberOfStartUps = settingsModel.getNumberOfStartUps();
    await settingsModel.incrementNumberOfStartUps();
    _isSetUpCompleted = settingsModel.isSetUpCompleted();
    _isLoadFinished = true;
  }

  void _openScreen() {
    if (!_isLoadFinished || !_isSplashTimeEnds) {
      return;
    }
    if (_numberOfStartUps > 0 && _isSetUpCompleted) {
      Navigator.of(context).pushReplacementNamed(RoutePath.home);
    } else {
      Navigator.of(context).pushReplacementNamed(RoutePath.initial);
    }
  }

  @override
  Widget build(BuildContext context) {
    _loading().then((_) {
      _openScreen();
    });
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(Assets.splash),
      ),
    );
  }
}
