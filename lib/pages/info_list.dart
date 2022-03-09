import 'package:flutter/material.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/info/info_list.dart';

class InfoListPage extends StatelessWidget {
  static const routeName = 'infolist';

  const InfoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      header: 'Info',
      parentBuilder: ({required child, required title}) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
      ),
      childBuilder: (sc) => InfoList(scrollController: sc),
    );
  }
}
