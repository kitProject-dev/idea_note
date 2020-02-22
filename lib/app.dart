import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:idea_note/localization.dart';
import 'package:idea_note/model/settings_model.dart';
import 'package:idea_note/repository/setting/setting.dart';
import 'package:idea_note/route.dart';
import 'package:idea_note/screens/home_screen.dart';
import 'package:idea_note/screens/initial_screen.dart';
import 'package:idea_note/screens/note_edit_screen.dart';
import 'package:idea_note/screens/note_view_screen.dart';
import 'package:idea_note/screens/settings_screen.dart';
import 'package:idea_note/screens/splash_screen.dart';
import 'package:idea_note/theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SettingsModel>.value(
          value: SettingsModel(
            Provider.of<Setting>(context),
          ),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.languages.keys.toList(),
        onGenerateTitle: (context) => AppLocalizations.of(context).title,
        theme: appTheme,
        onGenerateRoute: (settings) {
          Widget widget;
          switch (settings.name) {
            case RoutePath.initial:
              widget = InitialScreen();
              break;
            case RoutePath.home:
              widget = HomeScreen();
              break;
            case RoutePath.settings:
              widget = const SettingsScreen();
              break;
            case RoutePath.viewNote:
              widget = NoteViewScreen(settings.arguments as int);
              break;
            case RoutePath.editNote:
              widget = NoteEditScreen(settings.arguments as int);
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
