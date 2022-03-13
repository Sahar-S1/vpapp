import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vpapp/services/announcement.dart';
import 'package:vpapp/services/blog.dart';
import 'package:vpapp/services/club.dart';
import 'package:vpapp/services/course.dart';
import 'package:vpapp/services/department.dart';
import 'package:vpapp/services/directus.dart';
import 'package:vpapp/services/faculty.dart';
import 'package:vpapp/services/info.dart';
import 'package:vpapp/theme.dart';

Future<void> init() async {
  // Flutter Initializations
  WidgetsFlutterBinding.ensureInitialized();

  // External Library Initializations
  await Hive.initFlutter();

  // Custom Initializations
  await _initHive();
  await _initServices();
}

Future<void> _initHive() async {
  Hive.registerAdapter(ThemeModeAdapter());
  await Hive.openBox(AppTheme.box);
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
  getIt.registerSingletonWithDependencies<InfoService>(
    () => InfoService(directus: getIt.get<DirectusService>()),
    dependsOn: [DirectusService],
  );
  getIt.registerSingletonWithDependencies<DepartmentService>(
    () => DepartmentService(directus: getIt.get<DirectusService>()),
    dependsOn: [DirectusService],
  );
  getIt.registerSingletonWithDependencies<FacultyService>(
    () => FacultyService(directus: getIt.get<DirectusService>()),
    dependsOn: [DirectusService],
  );
  getIt.registerSingletonWithDependencies<CourseService>(
    () => CourseService(directus: getIt.get<DirectusService>()),
    dependsOn: [DirectusService],
  );

  await getIt.allReady();
}
