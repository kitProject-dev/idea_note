import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SelectableText('Setting'),
      ),
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
