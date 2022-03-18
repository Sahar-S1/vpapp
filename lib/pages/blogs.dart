import 'package:flutter/material.dart';
import 'package:vpapp/components/blogs/blogs_list.dart';
import 'package:vpapp/components/common/page_template.dart';

class BlogsPage extends StatelessWidget {
  static const routeName = 'blogs';

  const BlogsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      header: 'Blogs',
      parentBuilder: ({required child, required title}) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
      ),
      childBuilder: (sc) => BlogsList(scrollController: sc),
    );
  }
}
