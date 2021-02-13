import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:idea_note/config/assets.dart';

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
            padding: const EdgeInsets.only(top: 200, bottom: 20),
            child: Image.asset(Assets.tutorial2),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5),
                child: Text(
                  AppLocalizations.of(context).tutorialText2,
                  style: themeData.primaryTextTheme.bodyText2
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
            child: Row(
              children: <Widget>[
                const Spacer(),
                TextButton(
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
