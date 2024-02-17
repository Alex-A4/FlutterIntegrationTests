import 'package:flutter/material.dart';

const errorMessage = 'Текст пустой';
const labelMessage = 'Введите что-нибудь';
const formValidMessage = 'Форма валидна';

/// Корневой виджет страницы инпута
class InputApp extends StatelessWidget {
  const InputApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Инпут',
      home: InputPage(),
    );
  }
}

/// Основной виджет для проверки инпута
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // Контроллер для текстового поля, чтобы можно было управлять программно
  final _controller = TextEditingController();

  /// Глобальный ключ, чтобы можно было валидировать форму программно
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Инпут'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: _controller,
              validator: (value) {
                // Если значение инпута пустое, то показываем ошибку
                if (value == null || value.isEmpty) return errorMessage;

                // иначе ошибок нет
                return null;
              },
              decoration: InputDecoration(
                labelText: labelMessage,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.question_mark),
        onPressed: () {
          // Пытаемся валидировать форму (по дефолту не валидна)
          final valid = _formKey.currentState?.validate() ?? false;

          // Если форма валидна, то отображаем сообщение на 3 секунды
          if (valid) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(formValidMessage),
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
      ),
    );
  }
}
