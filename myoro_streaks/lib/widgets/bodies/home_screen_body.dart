import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_streaks/blocs/streaks_cubit.dart';
import 'package:myoro_streaks/models/streak.dart';
import 'package:myoro_streaks/widgets/bodies/base_body.dart';
import 'package:myoro_streaks/widgets/cards/streak_card.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<StreaksCubit, List<Streak>>(
        builder: (context, streaks) => BaseBody(
          children: [
            for (final Streak streak in streaks) ...[
              StreakCard(streak: streak),
              if (streaks[streaks.indexOf(streak)] != streaks.last)
                const SizedBox(height: 10),
            ],
          ],
        ),
      );
}
