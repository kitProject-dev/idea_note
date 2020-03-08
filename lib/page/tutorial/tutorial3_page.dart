import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_note/config/assets.dart';
import 'package:idea_note/config/route.dart';
import 'package:idea_note/localization.dart';

class Tutorial3Page extends StatelessWidget {
  const Tutorial3Page(this._pageController);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      color: Colors.green[300],
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 20),
            child: Image.asset(Assets.splash),
          ),
          Expanded(
            child: Center(
              child: Text(
                AppLocalizations.of(context).tutorialText3,
                style: themeData.primaryTextTheme.body1
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          RaisedButton(
            child: Text(AppLocalizations.of(context).doSetting),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            onPressed: () async {
              await Navigator.of(context).pushNamed(RoutePath.settingTitle);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
            child: Row(
              children: <Widget>[
                const Spacer(),
                FlatButton(
                  child: Text(
                    AppLocalizations.of(context).next,
                    style: themeData.textTheme.button
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
