import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vpapp/components/common/text_icon_card.dart';
import 'package:vpapp/models/info.dart';

class InfoCard extends StatelessWidget {
  final Info info;

  const InfoCard({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextIconCard(
      text: info.name,
      icon: CachedNetworkImage(
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
    );
  }
}
