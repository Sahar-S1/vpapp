import 'package:flutter/material.dart';
import 'package:vpapp/app.dart';
import 'package:vpapp/init.dart';

void main() async {
  // Initialize App
  await init();

  // Launch App
  const app = App();
  runApp(app);
}
