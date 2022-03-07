import 'package:flutter/material.dart';
import 'package:vpapp/components/announcements/announcment_card_content.dart';
import 'package:vpapp/models/announcement.dart';

class AnnouncementCard extends StatelessWidget {
  final Announcement announcement;

  const AnnouncementCard({Key? key, required this.announcement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: announcement.category.color,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      child: AnnouncementCardContent(announcement: announcement),
    );
  }
}
