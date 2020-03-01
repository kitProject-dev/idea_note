import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note/config/route.dart';
import 'package:idea_note/localization.dart';
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
              leading: const CircleAvatar(),
              title: Text(AppLocalizations.of(context).title),
              subtitle: Text('${settingsModel.getVersion()}'
                  ':${settingsModel.getBuildNumber()}'),
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.cog),
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
