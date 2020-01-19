import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:idea_note/localization.dart';
import 'package:idea_note/route.dart';
import 'package:idea_note/screens/home_screen.dart';
import 'package:idea_note/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
          case RoutePath.root:
            widget = const HomeScreen();
            break;
        }
        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return widget;
          },
        );
      },
    );
  }
}
