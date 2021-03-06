import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(this._title, {this.automaticallyImplyLeading = true})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  final String _title;
  final bool automaticallyImplyLeading;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_title),
      centerTitle: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}
