import 'package:flutter/material.dart';

class SettingTitleDoubleButton extends StatelessWidget {
  const SettingTitleDoubleButton(
      this._text1, this._onPressed1, this._text2, this._onPressed2);

  final String _text1;
  final VoidCallback _onPressed1;
  final String _text2;
  final VoidCallback _onPressed2;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 50, left: 50, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlineButton(
            child: Text(_text1, style: themeData.textTheme.button),
            onPressed: _onPressed1,
          ),
          const Spacer(),
          OutlineButton(
            child: Text(_text2, style: themeData.textTheme.button),
            onPressed: _onPressed2,
          ),
        ],
      ),
    );
  }
}
