import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vpapp/services/announcement.dart';
import 'package:vpapp/services/blog.dart';
import 'package:vpapp/services/club.dart';
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
  getIt.registerSingletonWithDependencies<AnnouncementService>(
    () => AnnouncementService(directus: getIt.get<DirectusService>()),
    dependsOn: [DirectusService],
  );
  getIt.registerSingletonWithDependencies<ClubService>(
    () => ClubService(directus: getIt.get<DirectusService>()),
    dependsOn: [DirectusService],
  );
  getIt.registerSingletonWithDependencies<BlogService>(
    () => BlogService(directus: getIt.get<DirectusService>()),
    dependsOn: [DirectusService],
  );

  await getIt.allReady();
}
