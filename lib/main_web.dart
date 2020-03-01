import 'package:flutter/widgets.dart';
import 'package:idea_note/app.dart';
import 'package:idea_note/repository/note/note_repository.dart';
import 'package:idea_note/repository/note/web/note_repository_web.dart';
import 'package:idea_note/repository/setting/setting_repository.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          Provider<NoteRepository>(
            create: (_) => NoteRepositoryWeb(),
            dispose: (context, value) => value.dispose(),
          ),
          Provider<SettingRepository>.value(
            value: SettingRepository(),
          ),
        ],
        child: App(),
      ),
    );
