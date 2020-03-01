import 'package:flutter/material.dart';
import 'package:idea_note/localization.dart';
import 'package:idea_note/widget/my_app_bar.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(AppLocalizations.of(context).setting),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: const Text('This is a ListPreference'),
            subtitle: const Text('Subtitle goes here'),
            onTap: () {},
          ),
          SwitchListTile(
            value: false,
            title: const Text('This is a SwitchPreference'),
            onChanged: (value) {},
          ),
          CheckboxListTile(
            value: true,
            title: const Text('This is a CheckBoxPreference'),
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
