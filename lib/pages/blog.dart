import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vpapp/components/common/html.dart';
import 'package:vpapp/components/common/page_error.dart';
import 'package:vpapp/components/common/page_loading.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/models/blog.dart';
import 'package:vpapp/services/blog.dart';

class BlogPage extends StatelessWidget with GetItMixin {
  static const routeName = 'blog';

  final int id;

  BlogPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return FutureBuilder<Blog>(
      future: get<BlogService>().getOne(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PageLoading();
        }

        if (snapshot.hasError) {
          return const PageError();
        }

        assert(snapshot.hasData);
        final blog = snapshot.data!;

        return PageTemplate(
          parentBuilder: ({required child, required title}) => Scaffold(
            appBar: AppBar(
              title: const Text('Blog'),
            ),
            body: child,
          ),
          childBuilder: (sc) => SingleChildScrollView(
            controller: sc,
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: blog.imageUrl,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          blog.title,
                          style: theme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Author: ' + blog.author,
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          children: blog.tags
                              .map(
                                (tag) => Container(
                                  padding: const EdgeInsets.all(6.0),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4.0,
                                    vertical: 3.0,
                                  ),
                                  child: Text(tag),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: theme.colorScheme.onSurface,
                                      style: BorderStyle.solid,
                                      width: 1.0,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        Html(
                          data: blog.content,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
