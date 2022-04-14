import 'package:flutter/material.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/discussions/discussions_list.dart';

class DiscussionsPage extends StatelessWidget {
  static const routeName = 'discussions';

  const DiscussionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return PageTemplate(
      header: 'Discussions',
      parentBuilder: ({required child, required title}) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.colorScheme.background,
          child: Icon(Icons.add, color: theme.colorScheme.onBackground),
          onPressed: () {},
        ),
      ),
      childBuilder: (sc) => DiscussionsList(scrollController: sc),
    );
  }
}
