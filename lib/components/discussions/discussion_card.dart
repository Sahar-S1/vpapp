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
      child: IntrinsicHeight(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: ClipOval(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      imageUrl: discussion.userCreated.avatarUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) {
                        return Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        );
                      },
                      errorWidget: (context, url, error) {
                        return const Center(
                          child: Icon(Icons.error),
                        );
                      },
                    ),
                  ),
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
              const SizedBox(width: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.message,
                    color: theme.colorScheme.onPrimaryContainer,
                    size: theme.textTheme.caption?.fontSize,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    discussion.comments.length <= 99
                        ? NumberFormat('000').format(discussion.comments.length)
                        : '99+',
                    style: theme.textTheme.caption,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
