import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_note/config/words.dart';
import 'package:idea_note/localization.dart';
import 'package:idea_note/model/setting_title_model.dart';
import 'package:provider/provider.dart';

class SettingTitleEditableWordsPage extends StatelessWidget {
  const SettingTitleEditableWordsPage(this._pageController, this._wordsType);

  final PageController _pageController;
  final WordsType _wordsType;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final settingTitleModel = Provider.of<SettingTitleModel>(context);
    final words = settingTitleModel.getWords(_wordsType).toList();
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Scrollbar(
        child: Column(
          children: [
            Text(AppLocalizations.of(context).titleSettingEditableWords),
            Expanded(
              child: ListView.builder(
                itemCount: words.length,
                itemBuilder: (context, index) {
                  return TextFormField(
                    initialValue: words[index],
                    decoration: InputDecoration(
                        labelText: '${AppLocalizations.of(context).word}'
                            ' ${index + 1}'),
                    onChanged: (value) {
                      words[index] = value;
                    },
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text(AppLocalizations.of(context).prev,
                      style: themeData.textTheme.button),
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
                  child: Text(AppLocalizations.of(context).next,
                      style: themeData.textTheme.button),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    settingTitleModel.setWords(_wordsType, words);
                    _pageController.nextPage(
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