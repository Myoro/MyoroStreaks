import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({ super.key });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return AppBar(
      title: Row(
        children: [
          Text(
            'MyoroStreaks',
            style: theme.textTheme.titleMedium,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}