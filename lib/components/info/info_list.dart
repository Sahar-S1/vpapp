import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vpapp/components/info/info_card.dart';
import 'package:vpapp/models/info.dart';
import 'package:vpapp/pages/info.dart';
import 'package:vpapp/services/info.dart';

class InfoList extends StatefulWidget with GetItStatefulWidgetMixin {
  final ScrollController scrollController;

  InfoList({Key? key, required this.scrollController}) : super(key: key);

  @override
  _InfoListState createState() => _InfoListState();
}

class _InfoListState extends State<InfoList> with GetItStateMixin {
  static const _pageSize = 20;

  final PagingController<int, Info> _pagingController =
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
      final newItems = await get<InfoService>().getPage(pageKey, _pageSize);
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
      child: PagedListView<int, Info>(
        scrollController: widget.scrollController,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Info>(
          itemBuilder: (context, info, index) => InkWell(
            onTap: () => context.goNamed(
              InfoPage.routeName,
              params: {'id': info.id.toString()},
            ),
            child: InfoCard(info: info),
          ),
        ),
      ),
    );
  }
}
