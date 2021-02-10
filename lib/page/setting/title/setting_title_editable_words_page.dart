import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:idea_note/config/words.dart';
import 'package:idea_note/model/setting_title_model.dart';
import 'package:idea_note/widget/setting_title/setting_title_content.dart';
import 'package:idea_note/widget/setting_title/setting_title_double_button.dart';
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
            SettingTitleContent(
                AppLocalizations.of(context).titleSettingEditableWords),
            Expanded(
              child: ListView.builder(
                itemCount: words.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      style: themeData.textTheme.body1,
                      initialValue: words[index],
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: '${AppLocalizations.of(context).word}'
                            ' ${index + 1}',
                        hintText: '${AppLocalizations.of(context).word}'
                            ' ${index + 1}',
                      ),
                      onChanged: (value) {
                        words[index] = value;
                      },
                    ),
                  );
                },
              ),
            ),
            SettingTitleDoubleButton(
              AppLocalizations.of(context).prev,
              () {
                _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              AppLocalizations.of(context).next,
              () {
                settingTitleModel.setWords(_wordsType, words);
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
