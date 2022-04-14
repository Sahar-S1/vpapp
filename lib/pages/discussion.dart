import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart'
    show Chat, DefaultChatTheme;
import 'package:flutter_chat_types/flutter_chat_types.dart'
    show TextMessage, User, Role;
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:intl/intl.dart';
import 'package:vpapp/components/common/page_error.dart';
import 'package:vpapp/components/common/page_loading.dart';
import 'package:vpapp/models/directus.dart';
import 'package:vpapp/models/discussion.dart';
import 'package:vpapp/services/auth.dart';
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
          var theme = Theme.of(context);

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
            body: ValueListenableBuilder<DirectusUser?>(
              valueListenable: get<AuthService>().currentUser,
              builder: (context, currentUser, child) => Chat(
                theme: DefaultChatTheme(
                  primaryColor: theme.colorScheme.primaryContainer,
                  backgroundColor: theme.backgroundColor,
                ),
                showUserAvatars: true,
                showUserNames: true,
                user: User(
                  id: currentUser!.id,
                  firstName: currentUser.firstName,
                  lastName: currentUser.lastName,
                  imageUrl: currentUser.avatarUrl,
                  role: Role.user,
                ),
                messages: (discussion.comments
                      ..sort((a, b) => -a.dateCreated.compareTo(b.dateCreated)))
                    .map((comment) => TextMessage(
                          id: comment.id.toString(),
                          author: User(
                            id: comment.userCreated.id,
                            firstName: comment.userCreated.firstName,
                            lastName: comment.userCreated.lastName,
                            imageUrl: comment.userCreated.avatarUrl,
                            role: Role.user,
                          ),
                          text: comment.comment,
                          createdAt: comment.dateCreated.millisecondsSinceEpoch,
                        ))
                    .toList(),
                onSendPressed: (text) {
                  get<DiscussionService>()
                      .comment(text.text, discussion.id)
                      .then((value) => setState(() {}));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
