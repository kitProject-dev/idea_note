import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_note/localization.dart';

class SettingTitleHomePage extends StatelessWidget {
  const SettingTitleHomePage(this._pageController);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Scrollbar(
        child: Column(
          children: [
            Text(AppLocalizations.of(context).titleSettingHome),
            const Spacer(),
            RaisedButton(
              child: Text(AppLocalizations.of(context).set,
                  style: themeData.textTheme.button),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
            ),
          ],
        ),
      ),
    );
  }
}
