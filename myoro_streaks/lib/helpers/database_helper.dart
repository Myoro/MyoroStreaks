import 'package:intl/intl.dart';
import 'package:myoro_streaks/database.dart';
import 'package:myoro_streaks/models/observation.dart';
import 'package:myoro_streaks/models/streak.dart';

/// File to make certain queries into functions
class DatabaseHelper {
  static Future<List<Streak>> selectStreaks() async {
    final List<Streak> streaks = (await Database.select('streaks'))
        .map(
          (json) => Streak.fromJson(json),
        )
        .toList();

    for (final Streak streak in streaks) {
      final List<DateTime> timesResetted = (await Database.select(
        'times_resetted',
        {'streak_id': streak.id},
      ))
          .map(
            (json) => DateFormat('dd/MM/yyyy-HH:mm:ss')
                .parse(json['date_of_reset'] as String),
          )
          .toList();

      final List<Observation> observations =
          (await Database.select('observations', {'streak_id': streak.id}))
              .map(
                (json) => Observation.fromJson(json),
              )
              .toList();

      streaks[streaks.indexOf(streak)] = streak.copyWith(
        timesResetted: timesResetted,
        observations: observations,
      );
    }

    return streaks;
  }
}
