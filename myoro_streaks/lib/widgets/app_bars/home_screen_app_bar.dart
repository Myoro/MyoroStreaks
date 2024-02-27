import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_streaks/blocs/dark_mode_cubit.dart';
import 'package:myoro_streaks/widgets/buttons/icon_button_without_feedback.dart';
import 'package:myoro_streaks/widgets/modals/streak_form_modal.dart';

class HomeScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeScreenAppBar({super.key});

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
          IconButtonWithoutFeedback(
            icon: Icons.add,
            size: 40,
            onTap: () => StreakFormModal.show(context),
          ),
          IconButtonWithoutFeedback(
            icon: Icons.sunny,
            size: 40,
            onTap: () => BlocProvider.of<DarkModeCubit>(context).toggle(),
          ),
        ],
      ),
    );
  }
}
