import 'package:deepvr/core/di/locator.dart';
import 'package:deepvr/core/ui/screens/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//TODO перелистывание историй при завершении
//TODO жестко отреFUCKторить все приложение
void main() async {
  setup();
  WidgetsFlutterBinding.ensureInitialized();
  await locator.allReady();
  runApp(const App());
}

