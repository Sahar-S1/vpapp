import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vpapp/pages/home.dart';

class PageError extends StatelessWidget {
  const PageError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SelectableText(snapshot.error.toString()),
            Text(
              'Some internall error !!',
              style: theme.textTheme.headlineMedium
                  ?.apply(color: theme.errorColor),
            ),
            TextButton(
              onPressed: () => context.goNamed(HomePage.routeName),
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
