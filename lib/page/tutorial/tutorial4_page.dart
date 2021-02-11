import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:idea_note/config/route.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:provider/provider.dart';

class Tutorial4Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final settingsModel = Provider.of<SettingsModel>(context, listen: false);
    return Container(
      color: Colors.deepOrange[300],
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 5, left: 5),
                child: Text(
                  AppLocalizations.of(context).tutorialText4,
                  style: themeData.primaryTextTheme.headline6
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
                    AppLocalizations.of(context).done,
                    style: themeData.textTheme.button
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: () async {
                    await settingsModel.setUpCompleted();
                    await Navigator.of(context)
                        .pushReplacementNamed(RoutePath.home);
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
