import 'package:flutter/material.dart';
import 'package:flutter_integration_tests/countre_storage.dart';

String valueTitle(int value) {
  return 'Текущее значение: $value';
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Счетчик',
      home: CounterView(),
    );
  }
}

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  late final ValueNotifier<int> _notifier;

  @override
  void initState() {
    _notifier = ValueNotifier(CounterStorage.instance.counterValue);
    _notifier.addListener(() {
      CounterStorage.instance.setCounter(_notifier.value);
    });
    super.initState();
  }

  @override
  void dispose() {
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Счетчик'),
      ),
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: _notifier,
          builder: (context, value, child) {
            return Text(valueTitle(value));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _notifier.value = _notifier.value + 1,
        child: const Icon(Icons.add),
      ),
    );
  }
}
