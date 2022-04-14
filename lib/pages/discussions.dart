import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';
import 'package:vpapp/components/common/page_template.dart';
import 'package:vpapp/components/discussions/discussions_list.dart';
import 'package:vpapp/components/discussions/new_discussion_form.dart';
import 'package:vpapp/pages/discussion.dart';
import 'package:vpapp/services/discussion.dart';

class DiscussionsPage extends StatelessWidget with GetItMixin {
  static const routeName = 'discussions';

  DiscussionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return PageTemplate(
      header: 'Discussions',
      parentBuilder: ({required child, required title}) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(title),
        ),
        body: child,
        floatingActionButton: FloatingActionButton(
          backgroundColor: theme.colorScheme.background,
          child: Icon(Icons.add, color: theme.colorScheme.onBackground),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Container(
                  padding: const EdgeInsets.all(24.0),
                  child: IntrinsicHeight(
                    child: NewDiscussionForm(
                      onSubmit: (title, description) async {
                        var ds = get<DiscussionService>();

                        var discussionId = await ds.discuss(title);
                        if (description.isNotEmpty) {
                          await ds.comment(description, discussionId);
                        }

                        Navigator.of(context).pop();
                        context.goNamed(
                          DiscussionPage.routeName,
                          params: {
                            'id': discussionId.toString(),
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      childBuilder: (sc) => DiscussionsList(scrollController: sc),
    );
  }
}
