import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:test/app.dart';
import 'package:test/providers/app_provider.dart';

void main() {
  group('test Widget Tests', () {
    testWidgets('App should render without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AppProvider()),
          ],
          child: MaterialApp(
            home: AppHome(),
          ),
        ),
      );
      
      expect(find.byType(AppHome), findsOneWidget);
    });
    
    testWidgets('App should display app title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AppProvider()),
          ],
          child: MaterialApp(
            home: AppHome(),
          ),
        ),
      );
      
      expect(find.text('test'), findsOneWidget);
    });
  });
}
