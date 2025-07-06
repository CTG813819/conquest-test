import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  group('test Integration Tests', () {
    testWidgets('Complete app flow test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      
      // Verify app loads successfully
      expect(find.byType(MaterialApp), findsOneWidget);
      
      // Verify main screen is displayed
      expect(find.byType(Scaffold), findsOneWidget);
      
      // Verify app title is present
      expect(find.text('test'), findsOneWidget);
    });
    
    testWidgets('App navigation test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      
      // Test that app responds to user interaction
      await tester.tap(find.byType(Scaffold));
      await tester.pumpAndSettle();
      
      // App should still be responsive
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });
}
