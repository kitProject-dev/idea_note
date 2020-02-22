import 'package:flutter/widgets.dart';
import 'package:idea_note/app.dart';
import 'package:idea_note/repository/setting/setting.dart';
import 'package:idea_note/repository/storage/storage.dart';
import 'package:idea_note/repository/storage/web/web_storage.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          Provider<Storage>(
            create: (_) => WebStorage(),
            dispose: (context, value) => value.dispose(),
          ),
          Provider<Setting>.value(
            value: Setting(),
          ),
        ],
        child: App(),
      ),
    );
