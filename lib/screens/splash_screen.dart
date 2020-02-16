import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:idea_note/config/assets.dart';
import 'package:idea_note/config/preferences_key.dart';
import 'package:idea_note/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  bool _isSetUpCompleted = false;
  bool _isLoadPrefs = false;
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
    _getPrefs().then((_) {
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

  Future<void> _getPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _numberOfStartUps = prefs.getInt(PreferencesKey.numberOfStartUps) ?? 0;
    await prefs.setInt(PreferencesKey.numberOfStartUps, _numberOfStartUps + 1);
    _isSetUpCompleted = prefs.getBool(PreferencesKey.setUpCompleted) ?? false;
    _isLoadPrefs = true;
  }

  void _openScreen() {
    if (!_isLoadPrefs || !_isSplashTimeEnds) {
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
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(Assets.splash),
      ),
    );
  }
}
