import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_note/localization.dart';
import 'package:idea_note/widget/setting_title/setting_title_single_button.dart';

class SettingTitleHomePage extends StatelessWidget {
  const SettingTitleHomePage(this._pageController);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(AppLocalizations.of(context).titleSettingHome,
                  style: themeData.textTheme.body1),
            ),
          ),
          SettingTitleSingleButton(
            AppLocalizations.of(context).set,
            () {
              _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            },
          ),
        ],
      ),
    );
  }
}
