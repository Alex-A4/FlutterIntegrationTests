import 'package:flutter/material.dart';
import 'package:flutter_integration_tests/counter_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Тестируем интерфейс счетчика автоматически', () {
    testWidgets(
      'Нажатие на кнопку + один раз увеличивает счетчик',
      (tester) async {
        // Устанавливаем виджет в качестве сцены
        await tester.pumpWidget(const CounterApp());

        // Проверяем, что базовый текст равен 0
        expect(find.text('0'), findsOneWidget);

        // Находим виджет кнопки по его ключу
        // Ключ - уникальный идентификатор виджета в дереве (на экране)
        final fab = find.byKey(const Key('increment'));

        // Делаем задержку, чтобы увидеть UI
        await Future.delayed(const Duration(seconds: 1));

        // Имитируем нажатие на кнопку
        await tester.tap(fab);

        // Ожидаем следующего кадра, когда нажатие даст результат
        await tester.pumpAndSettle();

        // Делаем задержку, чтобы увидеть изменения
        await Future.delayed(const Duration(seconds: 1));

        // Проверяем, что текст стал равен 1
        expect(find.text('1'), findsOneWidget);
      },
    );

    testWidgets(
      'Нажатие на кнопку + пять раз увеличивает счетчик на 5',
      (tester) async {
        // Устанавливаем виджет в качестве сцены
        await tester.pumpWidget(const CounterApp());

        // Проверяем, что базовый текст равен 0
        expect(find.text('0'), findsOneWidget);

        // Находим виджет кнопки по его ключу
        // Ключ - уникальный идентификатор виджета в дереве (на экране)
        final fab = find.byKey(const Key('increment'));

        // Делаем задержку, чтобы увидеть UI
        await Future.delayed(const Duration(seconds: 1));

        for (var i = 0; i < 5; i++) {
          // Имитируем нажатие на кнопку
          await tester.tap(fab);
          // Ожидаем следующего кадра, когда нажатие даст результат
          await tester.pumpAndSettle();

          // Делаем задержку, чтобы увидеть UI
          await Future.delayed(const Duration(milliseconds: 500));
        }

        // Проверяем, что текст стал равен 5
        expect(find.text('5'), findsOneWidget);
      },
    );
  });
}
