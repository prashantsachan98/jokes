import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('fetches and displays a joke', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final fetchButton = find.byType(FloatingActionButton);
    expect(fetchButton, findsOneWidget);

    await tester.tap(fetchButton);
    await tester.pumpAndSettle();

    final jokeText = find.byType(Text).first;
    expect(jokeText, findsOneWidget);
  });
}
