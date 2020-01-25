import 'package:flutter/widgets.dart';
import 'package:idea_note/app.dart';
import 'package:idea_note/repository/storage/mobile/mobile_storage.dart';
import 'package:idea_note/repository/storage/storage.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          Provider<Storage>(
            create: (_) => MobileStorage(),
            dispose: (context, value) => value.dispose(),
          ),
        ],
        child: App(),
      ),
    );
