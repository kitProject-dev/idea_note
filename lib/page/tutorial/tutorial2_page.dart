import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_note/config/assets.dart';
import 'package:idea_note/localization.dart';

class Tutorial2Page extends StatelessWidget {
  const Tutorial2Page(this._pageController);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      color: Colors.red[300],
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 20),
            child: Image.asset(Assets.splash),
          ),
          Expanded(
            child: Center(
              child: Text(
                AppLocalizations.of(context).tutorialText2,
                style: themeData.primaryTextTheme.body1
                    .copyWith(color: Colors.white),
              ),
            ),
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
