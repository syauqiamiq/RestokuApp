import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';
import 'package:restaurant_app/view/setting_page.dart';

Widget createSettingScreen() => ChangeNotifierProvider(
      create: (context) => SchedulingProvider(),
      child: MaterialApp(
        home: SettingScreen(),
      ),
    );

void main() {
  testWidgets(
    "Test Switch Widget di SettingScreen",
    (WidgetTester tester) async {
      await tester.pumpWidget(createSettingScreen());
      expect(find.byType(Switch), findsOneWidget);
    },
  );
}
