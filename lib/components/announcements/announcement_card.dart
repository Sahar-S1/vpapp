import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vpapp/models/announcement.dart';
import 'package:vpapp/pages/announcement.dart';

class AnnouncementCard extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementCard({Key? key, required this.announcement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return InkWell(
      onTap: () => context.push(
        AnnouncementPage.routeName
            .replaceAll(':id', announcement.id.toString()),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
          side: BorderSide(
            color: announcement.category.color,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Text(
                  announcement.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: theme.primaryColor,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                  ),
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.play_arrow,
                          color: announcement.category.color,
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text(
                          announcement.category.name,
                          style: theme.textTheme.titleMedium,
                        ),
                      ),
                    ],
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
