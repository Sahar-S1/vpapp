import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vpapp/components/announcements/announcement_card.dart';
import 'package:vpapp/models/announcement.dart';
import 'package:vpapp/pages/announcement.dart';
import 'package:vpapp/services/announcement.dart';

class AnnouncementsList extends StatefulWidget with GetItStatefulWidgetMixin {
  AnnouncementsList({Key? key}) : super(key: key);

  @override
  _AnnouncementsListState createState() => _AnnouncementsListState();
}

class _AnnouncementsListState extends State<AnnouncementsList>
    with GetItStateMixin {
  static const _pageSize = 20;

  final PagingController<int, Announcement> _pagingController =
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
          await get<AnnouncementService>().getPage(pageKey, _pageSize);
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
      child: PagedListView<int, Announcement>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Announcement>(
          itemBuilder: (context, announcement, index) => InkWell(
            onTap: () => context.goNamed(
              AnnouncementPage.routeName,
              params: {'id': announcement.id.toString()},
            ),
            child: AnnouncementCard(announcement: announcement),
          ),
        ),
      ),
    );
  }
}
