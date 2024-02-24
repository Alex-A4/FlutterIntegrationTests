import 'package:flutter/material.dart';
import 'package:flutter_integration_tests/counter_app.dart';
import 'package:flutter_integration_tests/countre_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await CounterStorage.instance.init();
  });

  group('Тестируем счетчик автоматически', () {
    testWidgets(
      'При отсутствии данных инициализируется с 0',
      (tester) async {
        await (await SharedPreferences.getInstance()).clear();

        await tester.pumpWidget(const CounterApp());

        await Future.delayed(const Duration(seconds: 1));

        expect(find.text(valueTitle(0)), findsOneWidget);
      },
    );

    testWidgets(
      'При наличии данных инициализируется с ними',
      (tester) async {
        await (await SharedPreferences.getInstance()).setInt('counter_key', 10);

        await tester.pumpWidget(const CounterApp());

        await Future.delayed(const Duration(seconds: 1));

        expect(find.text(valueTitle(10)), findsOneWidget);
      },
    );

    testWidgets(
      'При наличии данных инициализируется с ними',
      (tester) async {
        await (await SharedPreferences.getInstance()).setInt('counter_key', 10);

        await tester.pumpWidget(const CounterApp());

        await Future.delayed(const Duration(seconds: 1));
        expect(find.text(valueTitle(10)), findsOneWidget);

        await tester.tap(find.byType(FloatingActionButton));

        await tester.pumpAndSettle();
        await Future.delayed(const Duration(seconds: 1));

        await (await SharedPreferences.getInstance()).setInt('counter_key', 11);
        expect(find.text(valueTitle(11)), findsOneWidget);
      },
    );
  });
}
