import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_note/model/setting_title_model.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:provider/provider.dart';

class SettingTitleResultPage extends StatelessWidget {
  const SettingTitleResultPage(this._pageController);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final settingsModel = Provider.of<SettingsModel>(context, listen: false);
    final settingTitleModel = Provider.of<SettingTitleModel>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Scrollbar(
        child: Column(
          children: [
            const Text('ワードを確認してください。'),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: ListView.builder(
                    itemCount: settingTitleModel.getWords(WordsType.a).length,
                    itemBuilder: (context, index) {
                      return Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              settingTitleModel.getWords(WordsType.a)[index],
                              style: TextStyle(
                                fontSize:
                                    themeData.textTheme.bodyText2.fontSize,
                              ),
                            ),
                          ));
                    },
                  )),
                  Expanded(
                      child: ListView.builder(
                    itemCount: settingTitleModel.getWords(WordsType.b).length,
                    itemBuilder: (context, index) {
                      return Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Text(
                              settingTitleModel.getWords(WordsType.b)[index],
                              style: TextStyle(
                                fontSize:
                                    themeData.textTheme.bodyText2.fontSize,
                              ),
                            ),
                          ));
                    },
                  ))
                ],
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
                RaisedButton(
                  child: Text('完了', style: themeData.textTheme.button),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    settingsModel.setWords(
                        settingTitleModel.getWords(WordsType.a),
                        settingTitleModel.getWords(WordsType.b));
                    Navigator.of(context).pop(true);
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
