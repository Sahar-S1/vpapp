import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vpapp/components/common/html.dart';
import 'package:vpapp/models/announcement.dart';
import 'package:vpapp/providers/announcements.dart';

class AnnouncementPage extends StatefulWidget {
  static const routeName = '/announcements/:id';

  final int id;

  const AnnouncementPage({Key? key, required this.id}) : super(key: key);

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  Future<Announcement>? _future;

  @override
  void initState() {
    super.initState();
    _fetch();
  }

  @override
  void didUpdateWidget(covariant AnnouncementPage oldWidget) {
    super.didUpdateWidget(oldWidget);

    // refresh cached data
    if (oldWidget.id != widget.id) _fetch();
  }

  void _fetch() =>
      _future = Provider.of<AnnouncementsProvider>(context, listen: false)
          .getOne(widget.id);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return FutureBuilder<Announcement>(
      future: _future,
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
                    onPressed: () => context.go('/'),
                    child: const Text('Home'),
                  ),
                ],
              ),
            ),
          );
        }

        assert(snapshot.hasData);
        final announcement = snapshot.data!;
        return Scaffold(
          appBar: AppBar(
            title: Text(announcement.title),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Html(
                data: announcement.description,
              ),
            ),
          ),
        );
      },
    );
  }
}
