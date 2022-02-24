import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vpapp/models/club.dart';

class ClubCard extends StatelessWidget {
  final Club club;

  const ClubCard({Key? key, required this.club}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: club.color,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: isLandscape ? 9 : 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      club.name,
                      style: theme.textTheme.titleLarge,
                    ),
                    Text(
                      club.agenda,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: isLandscape ? 1 : 2,
                child: CachedNetworkImage(
                  imageUrl: club.logoUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) {
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
            ],
          ),
        ),
      ),
    );
  }
}
