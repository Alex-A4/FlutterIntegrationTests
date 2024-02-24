import 'package:flutter/material.dart';

const labelMessage = 'Введите что-нибудь';
const errorMessage = 'Текст пустой';
const formValidMessage = 'Форма валидна';

class InputApp extends StatelessWidget {
  const InputApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Инпут',
      home: InputView(),
    );
  }
}

class InputView extends StatefulWidget {
  const InputView({super.key});

  @override
  State<InputView> createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  final _controller = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Инпут')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _key,
          child: TextFormField(
            controller: _controller,
            validator: (value) {
              if (value == null || value.isEmpty) return errorMessage;

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_key.currentState?.validate() ?? false) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(formValidMessage),
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}
