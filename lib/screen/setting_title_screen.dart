import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:idea_note/config/words.dart';
import 'package:idea_note/model/setting_title_model.dart';
import 'package:idea_note/page/setting/title/setting_title_editable_words_page.dart';
import 'package:idea_note/page/setting/title/setting_title_home_page.dart';
import 'package:idea_note/page/setting/title/setting_title_result_page.dart';
import 'package:idea_note/page/setting/title/setting_title_select_words_page.dart';
import 'package:idea_note/widget/my_app_bar.dart';
import 'package:provider/provider.dart';

class SettingTitleScreen extends StatefulWidget {
  @override
  _SettingTitleScreenState createState() => _SettingTitleScreenState();
}

class _SettingTitleScreenState extends State<SettingTitleScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SettingTitleModel>(
          create: (_) => SettingTitleModel(),
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop(false);
          return false;
        },
        child: Scaffold(
          appBar: MyAppBar(AppLocalizations.of(context).titleSetting),
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              SettingTitleHomePage(_pageController),
              SettingTitleSelectWordsPage(_pageController, WordsType.a),
              SettingTitleEditableWordsPage(_pageController, WordsType.a),
              SettingTitleSelectWordsPage(_pageController, WordsType.b),
              SettingTitleEditableWordsPage(_pageController, WordsType.b),
              SettingTitleResultPage(_pageController)
            ],
          ),
        ),
      ),
    );
  }
}
