import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:idea_note/config/assets.dart';
import 'package:idea_note/config/route.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:provider/provider.dart';

class Tutorial1Page extends StatelessWidget {
  const Tutorial1Page(this._pageController);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final settingsModel = Provider.of<SettingsModel>(context, listen: false);
    return Container(
      color: Colors.blue[300],
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 200, bottom: 20),
            child: Image.asset(Assets.tutorial1),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5),
                child: Text(
                  AppLocalizations.of(context).tutorialText1,
                  style: themeData.primaryTextTheme.body1
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
            child: Row(
              children: <Widget>[
                FlatButton(
                  child: Text(
                    AppLocalizations.of(context).skip,
                    style: themeData.textTheme.button
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: () async {
                    await settingsModel.setUpCompleted();
                    await Navigator.of(context)
                        .pushReplacementNamed(RoutePath.home);
                  },
                ),
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
