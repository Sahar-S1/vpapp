import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vpapp/models/announcement.dart';

class AnnouncementCardContent extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementCardContent({Key? key, required this.announcement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(8.0),
      child: IntrinsicHeight(
        child: Row(
          children: [
            VerticalDivider(
              thickness: 4,
              color: announcement.category.color,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    announcement.title,
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    announcement.category.name,
                    style: theme.textTheme.bodyMedium,
                  ),
                  Text(
                    'Date Published: ${DateFormat('MMM dd, yyyy').format(announcement.datePublished)}',
                    style: theme.textTheme.caption,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
