import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final String? title;
  final Color? backgroundColor;
  final Widget child;

  const BaseCard({
    super.key,
    this.title,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        if (title != null) ...[
          Text(
            title!,
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 5),
        ],
        Container(
          decoration: BoxDecoration(
            color: backgroundColor ??
                Theme.of(context).colorScheme.onPrimary.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: child,
          ),
        ),
      ],
    );
  }
}
