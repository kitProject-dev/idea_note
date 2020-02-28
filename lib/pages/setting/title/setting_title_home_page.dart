import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            const Text('2つのワードを設定していきます。'),
            const Spacer(),
            RaisedButton(
              child: Text('設定する', style: themeData.textTheme.button),
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
