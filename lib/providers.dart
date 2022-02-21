import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vpapp/providers/announcements.dart';
import 'package:vpapp/providers/directus.dart';

class AppProviders extends MultiProvider {
  AppProviders({
    Key? key,
    Widget Function(BuildContext, Widget?)? builder,
    Widget? child,
  }) : super(
          key: key,
          providers: [
            Provider<DirectusProvider>(
              create: (ctx) => DirectusProvider(),
              lazy: false,
            ),
            Provider<AnnouncementsProvider>(
              create: (ctx) => AnnouncementsProvider(
                directus: Provider.of<DirectusProvider>(ctx, listen: false),
              ),
            ),
          ],
          builder: builder,
          child: child,
        );
}
