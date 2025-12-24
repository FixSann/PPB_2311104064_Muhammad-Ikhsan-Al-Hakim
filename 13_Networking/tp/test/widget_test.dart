import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:tp/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(home: HomePage()));

    // counter awal 0
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // tap tombol +
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // counter jadi 1
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
