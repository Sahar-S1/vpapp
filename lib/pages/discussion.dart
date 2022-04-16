import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart'
    show Chat, DefaultChatTheme;
import 'package:flutter_chat_types/flutter_chat_types.dart'
    show TextMessage, User, Role;
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vpapp/components/common/page_error.dart';
import 'package:vpapp/components/common/page_loading.dart';
import 'package:vpapp/components/discussions/discussion_chat.dart';
import 'package:vpapp/models/discussion.dart';
import 'package:vpapp/services/discussion.dart';

class DiscussionPage extends StatelessWidget with GetItMixin {
  static const routeName = 'discussion';

  final int id;

  DiscussionPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => FutureBuilder<Discussion>(
        future: get<DiscussionService>().getOne(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const PageLoading();
          }

          if (snapshot.hasError) {
            return const PageError();
          }

          assert(snapshot.hasData);
          final discussion = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: Text(discussion.title),
            ),
            body: DiscussionChat(discussionId: discussion.id),
          );
        },
      ),
    );
  }
}
