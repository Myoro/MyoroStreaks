import 'package:flutter/material.dart';
import 'package:myoro_streaks/widgets/app_bars/home_screen_app_bar.dart';
import 'package:myoro_streaks/widgets/bodies/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: HomeScreenAppBar(),
        body: HomeScreenBody(),
      );
}
