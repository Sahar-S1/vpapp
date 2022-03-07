import 'package:flutter/material.dart';
import 'package:vpapp/components/blogs/blog_list.dart';

class BlogsPage extends StatelessWidget {
  static const routeName = 'blogs';

  const BlogsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs'),
      ),
      body: BlogsList(),
    );
  }
}
