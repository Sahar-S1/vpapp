import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';
import 'package:vpapp/components/auth/user_profile.dart';
import 'package:vpapp/models/directus.dart';
import 'package:vpapp/pages/login.dart';
import 'package:vpapp/services/auth.dart';

class UserAction extends StatelessWidget with GetItMixin {
  UserAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DirectusUser?>(
      valueListenable: get<AuthService>().currentUser,
      builder: (context, currentUser, child) {
        if (currentUser != null) {
          return IconButton(
            icon: CircleAvatar(
              backgroundImage:
                  CachedNetworkImageProvider(currentUser.avatarUrl),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => UserProfileDialog(user: currentUser),
              );
            },
          );
        } else {
          return IconButton(
            icon: const Icon(Icons.login),
            onPressed: () {
              context.goNamed(LoginPage.routeName);
            },
          );
        }
      },
    );
  }
}
