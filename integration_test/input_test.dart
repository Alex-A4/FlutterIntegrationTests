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
        await tester.pumpWidget(const InputApp());

        expect(find.text(labelMessage), findsOneWidget);
        expect(find.text(errorMessage), findsNothing);

        await Future.delayed(const Duration(seconds: 1));

        final fab = find.byType(FloatingActionButton);
        await tester.tap(fab);

        await tester.pumpAndSettle();

        await Future.delayed(const Duration(seconds: 1));

        expect(find.text(labelMessage), findsOneWidget);
        expect(find.text(errorMessage), findsOneWidget);
      },
    );

    testWidgets(
      'Валидация не пустого инпута отображает сообщение',
      (tester) async {
        await tester.pumpWidget(const InputApp());

        expect(find.text(labelMessage), findsOneWidget);
        expect(find.text(formValidMessage), findsNothing);
        expect(find.text(errorMessage), findsNothing);

        await Future.delayed(const Duration(seconds: 1));

        await tester.enterText(find.byType(TextFormField), 'Ыыыыыы');
        await tester.pumpAndSettle();

        await Future.delayed(const Duration(seconds: 1));

        final fab = find.byType(FloatingActionButton);
        await tester.tap(fab);

        await tester.pumpAndSettle();

        await Future.delayed(const Duration(seconds: 1));

        expect(find.text(labelMessage), findsOneWidget);
        expect(find.text(formValidMessage), findsOneWidget);
        expect(find.text(errorMessage), findsNothing);
      },
    );
  });
}
