import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final String? header;
  final Widget child;

  const PageTemplate({Key? key, required this.child, this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (header != null)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                header ?? '',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.appBarTheme.foregroundColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          if (header != null) const SizedBox(height: 12),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.only(
                top: 24,
                left: 16,
                right: 16,
                bottom: 0,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
                color: theme.colorScheme.primaryContainer,
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
