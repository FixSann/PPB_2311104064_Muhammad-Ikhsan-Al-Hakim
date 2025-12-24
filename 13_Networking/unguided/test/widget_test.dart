import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

import 'package:catatan_getx/main.dart';

void main() {
  testWidgets('App dapat dijalankan tanpa error', (WidgetTester tester) async {
    // Build aplikasi
    await tester.pumpWidget(const MyApp());

    // Cek apakah judul AppBar muncul
    expect(find.text('Daftar Catatan'), findsOneWidget);
  });
}
