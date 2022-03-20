import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:vpapp/components/common/text_icon_card.dart';
import 'package:vpapp/models/course.dart';
import 'package:vpapp/pages/depearment_semesters.dart';
import 'package:vpapp/services/year.dart';

class YearsList extends StatefulWidget with GetItStatefulWidgetMixin {
  final int departmentId;
  final ScrollController scrollController;

  YearsList({
    Key? key,
    required this.departmentId,
    required this.scrollController,
  }) : super(key: key);

  @override
  _YearsListState createState() => _YearsListState();
}

class _YearsListState extends State<YearsList> with GetItStateMixin {
  static const _pageSize = 20;

  final PagingController<int, Year> _pagingController =
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
      final newItems = await get<YearService>().getPage(pageKey, _pageSize);
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
      child: PagedListView<int, Year>(
        scrollController: widget.scrollController,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Year>(
          itemBuilder: (context, year, index) => InkWell(
            onTap: () => context.goNamed(
              DepartmentSemestersPage.routeName,
              params: {
                'id': widget.departmentId.toString(),
                'year': year.id.toString(),
              },
            ),
            child: TextIconCard(text: year.title),
          ),
        ),
      ),
    );
  }
}
