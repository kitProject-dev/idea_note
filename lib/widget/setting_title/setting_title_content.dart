import 'package:flutter/material.dart';

class SettingTitleContent extends StatelessWidget {
  const SettingTitleContent(this._content);

  final String _content;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Text(
          _content,
          style: themeData.textTheme.bodyText2),
    );
  }
}
