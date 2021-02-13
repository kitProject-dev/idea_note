import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:idea_note/config/route.dart';
import 'package:idea_note/config/theme.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:idea_note/repository/setting/setting_repository.dart';
import 'package:idea_note/screen/edit_note_screen.dart';
import 'package:idea_note/screen/home_screen.dart';
import 'package:idea_note/screen/setting_title_screen.dart';
import 'package:idea_note/screen/settings_screen.dart';
import 'package:idea_note/screen/splash_screen.dart';
import 'package:idea_note/screen/tutorial_screen.dart';
import 'package:idea_note/screen/view_note_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsModel>.value(
          value: SettingsModel(
            Provider.of<SettingRepository>(context),
          ),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateTitle: (context) => AppLocalizations.of(context).title,
        theme: appTheme,
        onGenerateRoute: (settings) {
          Widget widget;
          switch (settings.name) {
            case RoutePath.tutorial:
              widget = TutorialScreen();
              break;
            case RoutePath.home:
              widget = HomeScreen();
              break;
            case RoutePath.settings:
              widget = SettingsScreen();
              break;
            case RoutePath.viewNote:
              widget = ViewNoteScreen(settings.arguments as int);
              break;
            case RoutePath.editNote:
              widget = EditNoteScreen(settings.arguments as int);
              break;
            case RoutePath.settingTitle:
              widget = SettingTitleScreen();
              break;
          }
          return MaterialPageRoute<dynamic>(
            builder: (context) {
              return widget;
            },
          );
        },
        home: SplashScreen(),
      ),
    );
  }
}
