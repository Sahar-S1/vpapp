import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart' as flutter_html;
import 'package:url_launcher/url_launcher.dart';

class Html extends StatelessWidget {
  final String? data;

  const Html({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return flutter_html.Html(
      data: data,
      onLinkTap: (url, context, attributes, element) {
        if (url != null) launch(url);
      },
      onImageTap: (url, context, attributes, element) {
        if (url != null) {
          showImageViewer(
            context.buildContext,
            CachedNetworkImageProvider(url),
          );
        }
      },
    );
  }
}
