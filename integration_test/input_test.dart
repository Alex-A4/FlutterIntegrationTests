import 'package:flutter/material.dart';
import 'package:flutter_integration_tests/input_app.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Тестируем интерфейс инпута автоматически', () {
    testWidgets(
      'Валидация пустого инпута дает ошибку',
      (tester) async {
        // Устанавливаем виджет в качестве сцены
        await tester.pumpWidget(const InputApp());

        // Проверяем, что изначально ошибки нет и отображается label
        expect(find.text(errorMessage), findsNothing);
        expect(find.text(labelMessage), findsOneWidget);

        // Находим виджет кнопки по его типу
        final fab = find.byType(FloatingActionButton);

        // Имитируем нажатие на кнопку
        await tester.tap(fab);

        // Ожидаем следующего кадра, когда нажатие даст результат
        await tester.pumpAndSettle();

        // Делаем задержку, чтобы увидеть изменения
        await Future.delayed(const Duration(seconds: 1));

        // Проверяем, что отобразилась ошибка и label так же виден
        expect(find.text(errorMessage), findsOneWidget);
        expect(find.text(labelMessage), findsOneWidget);
      },
    );

    testWidgets(
      'Валидация не пустого инпута отображает текст',
      (tester) async {
        // Устанавливаем виджет в качестве сцены
        await tester.pumpWidget(const InputApp());

        // Проверяем, что изначально ошибки и сообщения о валидности нет, отображается label
        expect(find.text(errorMessage), findsNothing);
        expect(find.text(labelMessage), findsOneWidget);
        expect(find.text(formValidMessage), findsNothing);

        // вводим в инпут какой-нибудь текст
        await tester.enterText(find.byType(TextFormField), 'Ыыыы');

        // Находим виджет кнопки по его типу
        final fab = find.byType(FloatingActionButton);

        // Имитируем нажатие на кнопку
        await tester.tap(fab);

        // Ожидаем следующего кадра, когда нажатие даст результат
        await tester.pumpAndSettle();

        // Делаем задержку, чтобы увидеть изменения
        await Future.delayed(const Duration(seconds: 1));

        // Проверяем, что отобразилось сообщение о валидности, label все еще виден (сверху),
        // а ошибки нет
        expect(find.text(errorMessage), findsNothing);
        expect(find.text(labelMessage), findsOneWidget);
        expect(find.text(formValidMessage), findsOneWidget);
      },
    );
  });
}
