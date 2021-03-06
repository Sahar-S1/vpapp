import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vpapp/services/announcement.dart';
import 'package:vpapp/services/auth.dart';
import 'package:vpapp/services/blog.dart';
import 'package:vpapp/services/club.dart';
import 'package:vpapp/services/course.dart';
import 'package:vpapp/services/department.dart';
import 'package:vpapp/services/directus.dart';
import 'package:vpapp/services/discussion.dart';
import 'package:vpapp/services/faculty.dart';
import 'package:vpapp/services/info.dart';
import 'package:vpapp/services/semester.dart';
import 'package:vpapp/services/year.dart';
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

  getIt
    ..registerSingleton<DirectusService>(
      await DirectusService().init(),
    )
    ..registerSingleton<AuthService>(
      AuthService(directus: getIt.get<DirectusService>()),
    )
    ..registerSingleton<AnnouncementService>(
      AnnouncementService(directus: getIt.get<DirectusService>()),
    )
    ..registerSingleton<ClubService>(
      ClubService(directus: getIt.get<DirectusService>()),
    )
    ..registerSingleton<BlogService>(
      BlogService(directus: getIt.get<DirectusService>()),
    )
    ..registerSingleton<InfoService>(
      InfoService(directus: getIt.get<DirectusService>()),
    )
    ..registerSingleton<DepartmentService>(
      DepartmentService(directus: getIt.get<DirectusService>()),
    )
    ..registerSingleton<FacultyService>(
      FacultyService(directus: getIt.get<DirectusService>()),
    )
    ..registerSingleton<CourseService>(
      CourseService(directus: getIt.get<DirectusService>()),
    )
    ..registerSingleton<YearService>(
      YearService(directus: getIt.get<DirectusService>()),
    )
    ..registerSingleton<SemesterService>(
      SemesterService(directus: getIt.get<DirectusService>()),
    )
    ..registerSingleton<DiscussionService>(
      DiscussionService(directus: getIt.get<DirectusService>()),
    );
}
