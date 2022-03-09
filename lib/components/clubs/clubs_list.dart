import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vpapp/components/clubs/club_card.dart';
import 'package:vpapp/models/club.dart';
import 'package:vpapp/services/club.dart';

class ClubsList extends StatefulWidget with GetItStatefulWidgetMixin {
  final ScrollController scrollController;

  ClubsList({Key? key, required this.scrollController}) : super(key: key);

  @override
  _ClubsListState createState() => _ClubsListState();
}

class _ClubsListState extends State<ClubsList> with GetItStateMixin {
  static const _pageSize = 20;

  final PagingController<int, Club> _pagingController =
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
      final newItems = await get<ClubService>().getPage(pageKey, _pageSize);
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
      child: PagedListView<int, Club>(
        scrollController: widget.scrollController,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Club>(
          itemBuilder: (context, club, index) => InkWell(
            onTap: () => {}, // TODO
            child: ClubCard(club: club),
          ),
        ),
      ),
    );
  }
}
