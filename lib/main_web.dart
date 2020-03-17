import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:idea_note/app.dart';
import 'package:idea_note/repository/note/note_repository.dart';
import 'package:idea_note/repository/note/web/note_repository_web.dart';
import 'package:idea_note/repository/setting/setting_repository.dart';
import 'package:idea_note/repository/user_agent/user_agent_repository.dart';
import 'package:idea_note/repository/user_agent/web/user_agent_repository_web.dart';
import 'package:provider/provider.dart';

void main(){
  print(UserAgentRepositoryWeb().isMobile().toString());
  return runApp(
      MultiProvider(
        providers: [
          Provider<UserAgentRepository>.value(
            value: UserAgentRepositoryWeb(),
          ),
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
}
