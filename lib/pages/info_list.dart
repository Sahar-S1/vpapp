import 'package:flutter/material.dart';
import 'package:vpapp/components/info/info_list.dart';

class InfoListPage extends StatelessWidget {
  static const routeName = 'infolist';

  const InfoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
      ),
      body: InfoList(),
    );
  }
}
