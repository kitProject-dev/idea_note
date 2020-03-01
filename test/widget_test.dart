import 'package:flutter_test/flutter_test.dart';
import 'package:idea_note/app.dart';
import 'package:idea_note/repository/note/note_repository.dart';
import 'package:idea_note/repository/setting/setting_repository.dart';
import 'package:provider/provider.dart';

import 'repository/note/test_note_repository.dart';

Future<void> _createApp(WidgetTester tester) async {
  await tester.pumpWidget(
    MultiProvider(
      providers: [
        Provider<NoteRepository>(
          create: (_) => TestNoteRepository(),
          dispose: (context, value) => value.dispose(),
        ),
        Provider<SettingRepository>(
          create: (_) => SettingRepository(),
          dispose: (context, value) => value.dispose(),
        ),
      ],
      child: App(),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Smoke test', (tester) async {
    await _createApp(tester);
  });
}
