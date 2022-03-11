import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vpapp/models/faculty.dart';

class FacultyCard extends StatelessWidget {
  final Faculty faculty;

  const FacultyCard({Key? key, required this.faculty}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: const BorderSide(
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: CachedNetworkImageProvider(faculty.photoUrl),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      faculty.name,
                      style: theme.textTheme.titleMedium,
                    ),
                    Text(
                      faculty.role.name,
                      style: theme.textTheme.titleSmall,
                    ),
                    Expanded(child: Container()),
                    Text(
                      'Teaching: ${faculty.experience} Yrs',
                      style: theme.textTheme.caption,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
