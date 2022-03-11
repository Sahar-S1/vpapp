import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vpapp/components/blogs/blog_card.dart';
import 'package:vpapp/models/blog.dart';
import 'package:vpapp/pages/blog.dart';
import 'package:vpapp/services/blog.dart';

class BlogsList extends StatefulWidget with GetItStatefulWidgetMixin {
  final ScrollController scrollController;

  BlogsList({Key? key, required this.scrollController}) : super(key: key);

  @override
  _BlogsListState createState() => _BlogsListState();
}

class _BlogsListState extends State<BlogsList> with GetItStateMixin {
  static const _pageSize = 20;

  final PagingController<int, Blog> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final newItems = await get<BlogService>().getPage(pageKey, _pageSize);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
        () => _pagingController.refresh(),
      ),
      child: PagedListView<int, Blog>(
        scrollController: widget.scrollController,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Blog>(
          itemBuilder: (context, blog, index) => InkWell(
            onTap: () => context.goNamed(
              BlogPage.routeName,
              params: {'id': blog.id.toString()},
            ),
            child: BlogCard(blog: blog),
          ),
        ),
      ),
    );
  }
}
