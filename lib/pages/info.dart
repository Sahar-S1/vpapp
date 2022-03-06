import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vpapp/components/info/info_section_container.dart';
import 'package:vpapp/components/info/info_sections_column.dart';
import 'package:vpapp/models/info.dart';
import 'package:vpapp/pages/home.dart';
import 'package:vpapp/services/info.dart';

class InfoPage extends StatelessWidget with GetItMixin {
  static const routeName = 'info';

  final int id;

  InfoPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return FutureBuilder<Info>(
      future: get<InfoService>().getOne(id),
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
        final info = snapshot.data!;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Info'),
          ),
          body: SingleChildScrollView(
            child: InfoSectionsColumn(info: info),
          ),
        );
      },
    );
  }
}
