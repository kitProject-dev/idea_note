import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar(this._title) : preferredSize = Size.fromHeight(kToolbarHeight);

  final String _title;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
    );
  }
}
