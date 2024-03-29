import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myoro_streaks/blocs/streaks_cubit.dart';
import 'package:myoro_streaks/helpers/database_helper.dart';
import 'package:myoro_streaks/models/streak.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_streaks/blocs/dark_mode_cubit.dart';
import 'package:myoro_streaks/database.dart';
import 'package:myoro_streaks/helpers/platform_helper.dart';
import 'package:myoro_streaks/theme.dart';
import 'package:myoro_streaks/widgets/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (PlatformHelper.isDesktop) {
    windowManager.ensureInitialized();
    windowManager.setMinimumSize(const Size(300, 300));
  }

  if (kDebugMode) {
    await Database.init();
    await Database.reset();
  }
  await Database.init();
  final bool isDarkMode =
      (await Database.get('dark_mode'))['enabled'] == 1 ? true : false;
  final List<Streak> streaks = await DatabaseHelper.selectStreaks();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DarkModeCubit(isDarkMode)),
        BlocProvider(create: (context) => StreaksCubit(streaks)),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<DarkModeCubit, bool>(
        builder: (context, isDarkMode) => MaterialApp(
          title: 'Myoro Streaks',
          theme: createTheme(isDarkMode),
          home: const HomeScreen(),
        ),
      );
}
