import 'package:flutter/material.dart';

/// Корневой виджет страницы счетчика
class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Счетчик',
      home: CounterPage(),
    );
  }
}

/// Виджет, содержащий основное действие с инкрементом
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _counter = 0;

  /// Изменяем значение счетчика и обновляем состояние виджета (экрана)
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Счетчик'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Вы нажали на кнопку столько раз:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Ключ позволит найти конкретную кнопку в дереве виджетов
        key: const Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Увеличить',
        child: const Icon(Icons.add),
      ),
    );
  }
}
