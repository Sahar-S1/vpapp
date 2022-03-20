import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vpapp/components/common/text_icon_card.dart';
import 'package:vpapp/models/course.dart';
import 'package:vpapp/services/semester.dart';

class SemestersList extends StatefulWidget with GetItStatefulWidgetMixin {
  final int departmentId;
  final int yearId;
  final ScrollController scrollController;

  SemestersList({
    Key? key,
    required this.departmentId,
    required this.yearId,
    required this.scrollController,
  }) : super(key: key);

  @override
  _SemestersListState createState() => _SemestersListState();
}

class _SemestersListState extends State<SemestersList> with GetItStateMixin {
  static const _pageSize = 20;

  final PagingController<int, Semester> _pagingController =
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
      final newItems = await get<SemesterService>().getPage(
        pageKey,
        _pageSize,
        params: {
          'filter[year][id][_eq]': widget.yearId,
        },
      );
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
      child: PagedListView<int, Semester>(
        scrollController: widget.scrollController,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Semester>(
          itemBuilder: (context, semester, index) =>
              TextIconCard(text: semester.title),
        ),
      ),
    );
  }
}
