import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final String? title;
  final Widget? extraAction;
  final Color? backgroundColor;
  final Widget child;

  const BaseCard({
    super.key,
    this.title,
    this.extraAction,
    required this.child,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      children: [
        if (title != null || extraAction != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                if (title != null)
                  Text(
                    title!,
                    style: theme.textTheme.titleMedium,
                  ),
                if (extraAction != null) extraAction!,
              ],
            ),
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
