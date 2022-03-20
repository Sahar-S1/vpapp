import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vpapp/config.dart';
import 'package:vpapp/models/course.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  const CourseCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return InkWell(
      onTap: () => launch(
        '${AppConfig.directusAssetsEndpoint}/${course.syllabus}.pdf',
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: theme.primaryColor,
            style: BorderStyle.solid,
            width: 1.0,
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      course.name,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                    Text(
                      course.code,
                      style: theme.textTheme.caption,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'View Syllabus',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  course.abbr,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.headline5?.copyWith(
                    color: theme.hintColor,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
