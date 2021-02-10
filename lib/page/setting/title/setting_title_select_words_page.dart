import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:idea_note/config/words.dart';
import 'package:idea_note/model/setting_title_model.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:idea_note/widget/setting_title/setting_title_content.dart';
import 'package:idea_note/widget/setting_title/setting_title_single_button.dart';
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
      ..addAll({
        AppLocalizations.of(context).modifyCurrentSettings:
            settingsModel.getWords(_wordsType)
      });
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Scrollbar(
        child: Column(
          children: [
            SettingTitleContent(
                AppLocalizations.of(context).titleSettingSelectWords),
            Expanded(
              child: ListView.builder(
                itemCount: templates.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          templates.keys.toList()[index],
                          style: themeData.textTheme.body1,
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
            SettingTitleSingleButton(
              AppLocalizations.of(context).prev,
              () {
                _pageController.previousPage(
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
