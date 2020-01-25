import 'package:flutter_test/flutter_test.dart';
import 'package:idea_note/app.dart';
import 'package:idea_note/repository/storage/storage.dart';
import 'package:provider/provider.dart';

import 'repository/storage/test_storage.dart';


Future<void> _createApp(WidgetTester tester) async {
  await tester.pumpWidget(
    MultiProvider(
      providers: [
        Provider<Storage>(
          create: (_) => TestStorage(),
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
