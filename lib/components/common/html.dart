import 'package:flutter/material.dart';
import 'package:html/dom.dart' as dom;
import 'package:flutter_html/flutter_html.dart' as flutter_html;
import 'package:url_launcher/url_launcher.dart';

class Html extends StatelessWidget {
  final String? data;

  const Html({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return flutter_html.Html(
      data: data,
      onLinkTap: (
        String? url,
        flutter_html.RenderContext context,
        Map<String, String> attributes,
        dom.Element? element,
      ) {
        if (url != null) launch(url);
      },
    );
  }
}
