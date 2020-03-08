import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:idea_note/config/words.dart';
import 'package:idea_note/localization.dart';
import 'package:idea_note/model/setting_title_model.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:idea_note/widget/setting_title/setting_title_content.dart';
import 'package:idea_note/widget/setting_title/setting_title_double_button.dart';
import 'package:idea_note/widget/setting_title/setting_title_result_list.dart';
import 'package:provider/provider.dart';

class SettingTitleResultPage extends StatelessWidget {
  const SettingTitleResultPage(this._pageController);

  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    final settingsModel = Provider.of<SettingsModel>(context, listen: false);
    final settingTitleModel = Provider.of<SettingTitleModel>(context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Scrollbar(
        child: Column(
          children: [
            SettingTitleContent(
                AppLocalizations.of(context).titleSettingResult),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, right: 2.5),
                      child: SettingTitleResultList(
                        settingTitleModel.getWords(WordsType.a),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2.5, right: 5),
                      child: SettingTitleResultList(
                        settingTitleModel.getWords(WordsType.b),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SettingTitleDoubleButton(
              AppLocalizations.of(context).prev,
              () {
                _pageController.previousPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              AppLocalizations.of(context).done,
              () {
                settingsModel.setWords(settingTitleModel.getWords(WordsType.a),
                    settingTitleModel.getWords(WordsType.b));
                Navigator.of(context).pop(true);
              },
            ),
          ],
        ),
      ),
    );
  }
}
