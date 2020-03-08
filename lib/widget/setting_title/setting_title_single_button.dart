import 'package:flutter/material.dart';

class SettingTitleSingleButton extends StatelessWidget {
  const SettingTitleSingleButton(this._text, this._onPressed);

  final String _text;
  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: OutlineButton(
        child: Text(_text, style: themeData.textTheme.button),
        onPressed: _onPressed,
      ),
    );
  }
}
