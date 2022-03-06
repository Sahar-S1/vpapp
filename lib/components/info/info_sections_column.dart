import 'package:flutter/material.dart';
import 'package:vpapp/components/info/info_section_container.dart';
import 'package:vpapp/models/info.dart';

class InfoSectionsColumn extends StatelessWidget {
  final Info info;

  const InfoSectionsColumn({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Column(
      children: info.sections
          .asMap()
          .map(
            (i, e) => MapEntry(
              i,
              InfoSectionContainer(
                section: e,
                bgColor: i % 2 == 0 ? theme.backgroundColor : theme.splashColor,
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
