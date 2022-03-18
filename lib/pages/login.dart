import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:vpapp/components/auth/login_form.dart';
import 'package:vpapp/config.dart';

class LoginPage extends StatelessWidget {
  static const routeName = 'login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const Spacer(),
            CachedNetworkImage(
              imageUrl: AppConfig.logoUrl,
              color: theme.colorScheme.primaryContainer,
              width: 0.6 * MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Center(
                  child: CircularProgressIndicator(
                    value: downloadProgress.progress,
                  ),
                );
              },
              errorWidget: (context, url, error) {
                return const Center(
                  child: Icon(Icons.error),
                );
              },
            ),
            const SizedBox(height: 56.0),
            LoginForm(),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
