import 'package:flutter/material.dart';
import 'package:vpapp/components/blogs/blog_list.dart';
import 'package:vpapp/components/common/page_template.dart';

class BlogsPage extends StatelessWidget {
  static const routeName = 'blogs';

  const BlogsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageTemplate(
        header: 'Blogs',
        child: BlogsList(),
      ),
    );
  }
}
