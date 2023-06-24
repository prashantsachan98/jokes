import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('app should display a joke when the button is pressed', (tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Press the button to fetch a joke'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.mood));
    await tester.pumpAndSettle();

    expect(find.text('Press the button to fetch a joke'), findsNothing);
    expect(find.text('Error'), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(Text), findsNWidgets(2));
  });
}
