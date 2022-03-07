import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vpapp/models/info.dart';

class InfoCard extends StatelessWidget {
  final Info info;

  const InfoCard({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Card(
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
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 8,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    info.name,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: info.iconUrl,
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
