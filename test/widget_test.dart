import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel_korea_app/main.dart'; // MyApp 가져옴

void main() {
  testWidgets('app builds', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MyApp(info: <String, dynamic>{}), // 빈 맵 전달
    );
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
