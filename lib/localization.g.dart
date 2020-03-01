// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// SheetLocalizationGenerator
// **************************************************************************

class AppLocalizations {
  AppLocalizations(this.locale) : this.labels = languages[locale];

  final Locale locale;

  static final Map<Locale, AppLocalizations_Labels> languages = {
    Locale.fromSubtags(languageCode: "ja"): AppLocalizations_Labels(
      title: "Idea note",
      setting: "設定",
      titleSetting: "タイトル設定",
      save: "保存",
      playCount: "カウント開始",
      stopCount: "カウント終了",
      changeTitle: "タイトル変更",
      titleSettingHome: "2つのワードを設定していきます。",
      titleSettingSelectWords: "ワードセットを選んでください。",
      titleSettingEditableWords: "ワードを編集してください。",
      titleSettingResult: "ワードを確認してください。",
      set: "設定する",
      modifyCurrentSettings: "現在の設定値を修正",
      word: "Word",
      prev: "戻る",
      next: "次へ",
      done: "完了",
    ),
  };

  final AppLocalizations_Labels labels;

  static AppLocalizations_Labels of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)?.labels;
}

class AppLocalizations_Labels {
  const AppLocalizations_Labels(
      {this.title,
      this.setting,
      this.titleSetting,
      this.save,
      this.playCount,
      this.stopCount,
      this.changeTitle,
      this.titleSettingHome,
      this.titleSettingSelectWords,
      this.titleSettingEditableWords,
      this.titleSettingResult,
      this.set,
      this.modifyCurrentSettings,
      this.word,
      this.prev,
      this.next,
      this.done});

  final String title;

  final String setting;

  final String titleSetting;

  final String save;

  final String playCount;

  final String stopCount;

  final String changeTitle;

  final String titleSettingHome;

  final String titleSettingSelectWords;

  final String titleSettingEditableWords;

  final String titleSettingResult;

  final String set;

  final String modifyCurrentSettings;

  final String word;

  final String prev;

  final String next;

  final String done;
}
