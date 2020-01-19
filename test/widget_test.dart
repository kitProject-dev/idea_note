import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:idea_note/app.dart';

Future<void> _createApp(WidgetTester tester) async {
  await tester.pumpWidget(App());
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    await _createApp(tester);

    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(FontAwesomeIcons.plus));
    await tester.pump();

    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
