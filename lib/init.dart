import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vpapp/services/announcements.dart';
import 'package:vpapp/services/directus.dart';

Future<void> init() async {
  // Flutter Initializations
  WidgetsFlutterBinding.ensureInitialized();

  // External Library Initializations
  await Hive.initFlutter();

  // Custom Initializations
  await _initServices();
}

Future<void> _initServices() async {
  var getIt = GetIt.instance;

  getIt.registerSingletonAsync<DirectusService>(
    () async => await DirectusService().init(),
  );
  getIt.registerSingletonWithDependencies<AnnouncementsService>(
    () => AnnouncementsService(directus: getIt.get<DirectusService>()),
    dependsOn: [DirectusService],
  );

  await getIt.allReady();
}
