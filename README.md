# Проект, позволяющий запускать автоматические UI (интеграционные) тесты на разных устройствах и смотреть как они исполняются

### Для запуска проекта необходимо:
1. Установить [flutter sdk](https://docs.flutter.dev/get-started/install) согалсно инструкции
2. Добавить flutter в PATH
3. Открыть проект с помощью VSCode / AndroidStudio
4. Выполнить команду `flutter pub get` для загрузки зависимостей
5. Запустить `lib/main.dart` с использованием функционала IDE или в терминале вызвать команду `flutter run lib/main.dart` (Обратите внимание, что там можно выбрать два экрана внутри функции `runApp`)

# Документация по запуску тестов по [ссылке](https://docs.flutter.dev/cookbook/testing/integration/introduction) или ниже

### Для запуска интеграционных тестов с помощью мобильных устройств/эмулятора необходимо:
1. Запустить эмулятор или подключить устройство по проводу
2. Вызвать команду: `flutter test integration_test/` или `flutter test integration_test/counter_test.dart`, если нужен конкретный файл с тестами.
3. Открыть экран устройства/эмулятора, чтобы видеть прогресс


### Для запуска интеграционных тестов с помощью веб-браузера необходимо:
1. Установить chromedriver по [ссылке](https://googlechromelabs.github.io/chrome-for-testing/#stable)
2. Добавить chromedriver в PATH
3. Запустить chromdriver с помощью команды `chromedriver --port=4444`
4. Запустить выполнение тестов с помощью команды
`
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/all.dart \
  -d chrome
`
5. Если нужно запустить конкретный файл, то в качестве `--target` вместо `all.dart` указываем название файла.
6. Находим открывшуюся вкладку *GoogleChrome*, чтобы видеть прогресс