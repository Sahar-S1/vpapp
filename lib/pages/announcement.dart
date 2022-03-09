import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vpapp/components/announcements/announcment_card_content.dart';
import 'package:vpapp/components/common/html.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/models/announcement.dart';
import 'package:vpapp/pages/home.dart';
import 'package:vpapp/services/announcement.dart';

class AnnouncementPage extends StatelessWidget with GetItMixin {
  static const routeName = 'announcement';

  final int id;

  AnnouncementPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return FutureBuilder<Announcement>(
      future: get<AnnouncementService>().getOne(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(title: const Text('Loading...')),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SelectableText(snapshot.error.toString()),
                  Text(
                    'Some internall error !!',
                    style: theme.textTheme.headlineMedium
                        ?.apply(color: theme.errorColor),
                  ),
                  TextButton(
                    onPressed: () => context.goNamed(HomePage.routeName),
                    child: const Text('Home'),
                  ),
                ],
              ),
            ),
          );
        }

        assert(snapshot.hasData);
        final announcement = snapshot.data!;
        return PageTemplate(
          parentBuilder: ({required child, required title}) => Scaffold(
            appBar: AppBar(
              title: const Text('Announcement'),
            ),
            body: child,
          ),
          childBuilder: (sc) => Card(
            child: Column(
              children: [
                AnnouncementCardContent(announcement: announcement),
                Expanded(
                  child: SingleChildScrollView(
                    controller: sc,
                    child: Html(
                      data: announcement.description,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
