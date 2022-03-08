import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:udea_biosecurity_app/widgets/ui/ui_widgets.dart';

void main() {
  testWidgets('ui drawer test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: UiDrawer(),
    ));

    expect(find.textContaining('Udea Biosegura App'), findsOneWidget);
    expect(find.textContaining('Item 1'), findsOneWidget);
    expect(find.textContaining('Item 2'), findsOneWidget);
  });
}
