import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:vpapp/app.dart';
import 'package:vpapp/init.dart';
import 'package:vpapp/services/blog.dart';
import 'package:vpapp/services/club.dart';

void main() async {
  await init();

  if (kDebugMode) {
    print(await GetIt.instance.get<BlogService>().getAll());
  }
  const app = App();
  runApp(app);
}
