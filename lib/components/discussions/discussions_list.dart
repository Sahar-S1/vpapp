import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vpapp/components/discussions/discussion_card.dart';
import 'package:vpapp/models/discussion.dart';
import 'package:vpapp/pages/discussion.dart';
import 'package:vpapp/services/discussion.dart';

class DiscussionsList extends StatefulWidget with GetItStatefulWidgetMixin {
  final ScrollController scrollController;

  DiscussionsList({Key? key, required this.scrollController}) : super(key: key);

  @override
  _DiscussionsListState createState() => _DiscussionsListState();
}

class _DiscussionsListState extends State<DiscussionsList>
    with GetItStateMixin {
  static const _pageSize = 20;

  final PagingController<int, Discussion> _pagingController =
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
      final newItems =
          await get<DiscussionService>().getPage(pageKey, _pageSize);
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
      child: PagedListView<int, Discussion>(
        scrollController: widget.scrollController,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Discussion>(
          itemBuilder: (context, discussion, index) => InkWell(
            onTap: () => context.goNamed(
              DiscussionPage.routeName,
              params: {'id': discussion.id.toString()},
            ),
            child: DiscussionCard(discussion: discussion),
          ),
        ),
      ),
    );
  }
}
