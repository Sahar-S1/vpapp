import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vpapp/app.dart';
import 'package:vpapp/providers/directus.dart';

void main() async {
  // Flutter Initializations
  WidgetsFlutterBinding.ensureInitialized();

  // External Library Initializations
  await Hive.initFlutter();

  // Custom Initializations
  await DirectusProvider.instance.init();

  // Launch App
  const app = App();
  runApp(app);
}
