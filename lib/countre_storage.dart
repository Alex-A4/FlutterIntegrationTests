import 'package:shared_preferences/shared_preferences.dart';

const _counterKey = 'counter_key';

class CounterStorage {
  CounterStorage._();

  static CounterStorage instance = CounterStorage._();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  late SharedPreferences preferences;

  int get counterValue {
    return preferences.getInt(_counterKey) ?? 0;
  }

  Future<void> setCounter(int newValue) =>
      preferences.setInt(_counterKey, newValue);
}
