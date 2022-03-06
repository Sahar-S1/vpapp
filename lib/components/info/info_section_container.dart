import 'package:flutter/material.dart';
import 'package:vpapp/components/common/html.dart';
import 'package:vpapp/models/info.dart';

class InfoSectionContainer extends StatelessWidget {
  final InfoSection section;
  final Color? bgColor;

  const InfoSectionContainer({Key? key, required this.section, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var decorationIcon = Icon(
      Icons.menu_rounded,
      size: theme.textTheme.bodySmall?.fontSize,
    );

    return Container(
      padding: const EdgeInsets.all(8.0),
      color: bgColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              decorationIcon,
              Text(
                section.title,
                style: theme.textTheme.titleLarge,
              ),
              decorationIcon,
            ],
          ),
          Html(
            data: section.description,
          ),
        ],
      ),
    );
  }
}
