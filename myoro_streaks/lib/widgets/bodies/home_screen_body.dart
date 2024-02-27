import 'package:flutter/material.dart';
import 'package:myoro_streaks/models/streak.dart';
import 'package:myoro_streaks/widgets/bodies/base_body.dart';
import 'package:myoro_streaks/widgets/cards/streak_card.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) => BaseBody(
        children: [
          StreakCard(streak: Streak.sampleStreak),
        ],
      );
}
