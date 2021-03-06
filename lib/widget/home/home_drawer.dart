import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note/config/assets.dart';
import 'package:idea_note/config/route.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsModel = Provider.of<SettingsModel>(context, listen: false);
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Image.asset(Assets.avatar),
              title: Text(AppLocalizations.of(context).title),
              subtitle: Text('Version ${settingsModel.getVersion()}'
                  ':${settingsModel.getBuildNumber()}'),
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.cog),
              title: Text(AppLocalizations.of(context).titleSetting),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(RoutePath.settingTitle);
              },
            ),
          ],
        ),
      ),
    );
  }
}
