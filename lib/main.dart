import 'package:flutter/material.dart';
import 'package:flutter_integration_tests/counter_app.dart';
import 'package:flutter_integration_tests/countre_storage.dart';
import 'package:flutter_integration_tests/input_app.dart';

/// Точка входа в приложение
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CounterStorage.instance.init();

  runApp(
    const CounterApp(),

    // const InputApp(),
  );
}
