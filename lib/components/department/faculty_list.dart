import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vpapp/components/department/faculty_card.dart';
import 'package:vpapp/models/faculty.dart';
import 'package:vpapp/services/faculty.dart';

class FacultyList extends StatefulWidget with GetItStatefulWidgetMixin {
  final int departmentId;
  final ScrollController scrollController;

  FacultyList(
      {Key? key, required this.departmentId, required this.scrollController})
      : super(key: key);

  @override
  _FacultyListState createState() => _FacultyListState();
}

class _FacultyListState extends State<FacultyList> with GetItStateMixin {
  static const _pageSize = 20;

  final PagingController<int, Faculty> _pagingController =
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
      final newItems = await get<FacultyService>().getPage(
        pageKey,
        _pageSize,
        params: {
          'filter[department][_eq]': widget.departmentId,
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
      child: PagedListView<int, Faculty>(
        scrollController: widget.scrollController,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Faculty>(
          itemBuilder: (context, faculty, index) =>
              FacultyCard(faculty: faculty),
        ),
      ),
    );
  }
}
