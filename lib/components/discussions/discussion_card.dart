import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vpapp/models/discussion.dart';

class DiscussionCard extends StatelessWidget {
  final Discussion discussion;

  const DiscussionCard({Key? key, required this.discussion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(
          color: Color.fromARGB(100, 0, 0, 0),
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(
                discussion.userCreated.avatarUrl,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    discussion.title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    discussion.userCreated.name,
                    style: theme.textTheme.labelMedium,
                  ),
                  Text(
                    DateFormat.yMMMd().format(discussion.dateCreated),
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
