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

    Widget getLine(double width, double thickness) => SizedBox(
          width: width,
          height: thickness,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: theme.textTheme.titleLarge?.color,
            ),
          ),
        );

    Widget getDecorationIcon(CrossAxisAlignment alignment) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: alignment,
          children: [
            getLine(10, 1),
            const SizedBox(height: 1.5),
            getLine(15, 1),
            const SizedBox(height: 1.5),
            getLine(10, 1),
          ],
        );

    return Container(
      padding: const EdgeInsets.all(8.0),
      color: bgColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              getDecorationIcon(CrossAxisAlignment.end),
              const SizedBox(width: 4),
              Text(
                section.title,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(width: 4),
              getDecorationIcon(CrossAxisAlignment.start),
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
