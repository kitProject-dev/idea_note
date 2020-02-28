import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_note/config/words.dart';
import 'package:idea_note/model/setting_title_model.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:provider/provider.dart';

class SettingTitleSelectWordsPage extends StatelessWidget {
  const SettingTitleSelectWordsPage(this._pageController, this._wordsType);

  final PageController _pageController;
  final WordsType _wordsType;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final settingTitleModel = Provider.of<SettingTitleModel>(context);
    final settingsModel = Provider.of<SettingsModel>(context);
    final templates = <String, List<String>>{}
      ..addAll(Words.templates)
      ..addAll({'現在の設定値を修正': settingsModel.getWords(_wordsType)});
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Scrollbar(
        child: Column(
          children: [
            const Text('ワードセットを選んでください。'),
            Expanded(
              child: ListView.builder(
                itemCount: templates.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          templates.keys.toList()[index],
                          style: TextStyle(
                            fontSize: themeData.textTheme.bodyText2.fontSize,
                          ),
                        ),
                      ),
                      onTap: () {
                        settingTitleModel.setWords(_wordsType,
                            templates[templates.keys.toList()[index]]);
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text('戻る', style: themeData.textTheme.button),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
