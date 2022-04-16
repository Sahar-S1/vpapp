import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart'
    show Chat, DefaultChatTheme;
import 'package:flutter_chat_types/flutter_chat_types.dart'
    show TextMessage, User, Role;
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:vpapp/models/directus.dart';
import 'package:vpapp/models/discussion.dart';
import 'package:vpapp/services/auth.dart';
import 'package:vpapp/services/discussion.dart';
import 'package:vpapp/utils/timer.dart';

class DiscussionChat extends StatefulWidget with GetItStatefulWidgetMixin {
  final int discussionId;

  DiscussionChat({Key? key, required this.discussionId}) : super(key: key);

  @override
  State<DiscussionChat> createState() => _DiscussionChatState();
}

class _DiscussionChatState extends State<DiscussionChat> with GetItStateMixin {
  Timer? _timer;
  Discussion? discussion;

  @override
  void initState() {
    super.initState();

    _timer = makePeriodicTimer(
      duration: const Duration(seconds: 1),
      callback: (timer) => refresh(),
      fireNow: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  void refresh() {
    get<DiscussionService>().getOne(widget.discussionId).then((value) {
      setState(() {
        discussion = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ValueListenableBuilder<DirectusUser?>(
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
        messages: discussion == null
            ? []
            : (discussion!.comments
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
              .comment(text.text, widget.discussionId)
              .then((value) => refresh());
        },
      ),
    );
  }
}
