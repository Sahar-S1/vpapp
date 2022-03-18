import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vpapp/components/common/page_error.dart';
import 'package:vpapp/components/common/page_loading.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/info/info_sections_column.dart';
import 'package:vpapp/models/info.dart';
import 'package:vpapp/services/info.dart';

class InfoPage extends StatelessWidget with GetItMixin {
  static const routeName = 'info';

  final int id;

  InfoPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Info>(
      future: get<InfoService>().getOne(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PageLoading();
        }

        if (snapshot.hasError) {
          return const PageError();
        }

        assert(snapshot.hasData);
        final info = snapshot.data!;

        return PageTemplate(
          header: info.name,
          parentBuilder: ({required child, required title}) => Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: child,
          ),
          childBuilder: (sc) => SingleChildScrollView(
            controller: sc,
            child: InfoSectionsColumn(info: info),
          ),
        );
      },
    );
  }
}
