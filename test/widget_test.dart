import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trilink_flutter_assignment/main.dart';

void main() {
  testWidgets('App loads successfully', (WidgetTester tester) async {
    // Now the compiler will know exactly what MyApp is!
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}