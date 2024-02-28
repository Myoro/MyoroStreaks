import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myoro_streaks/database.dart';
import 'package:myoro_streaks/helpers/database_helper.dart';
import 'package:myoro_streaks/models/observation.dart';
import 'package:myoro_streaks/models/streak.dart';

class StreaksCubit extends Cubit<List<Streak>> {
  StreaksCubit(super.streaks);

  void addStreak(Streak streak) async {
    final int id = (await Database.insert('streaks', streak.toJson))['id'];
    emit(state..add(streak.copyWith(id: id)));
  }

  void addObservation(Observation observation) async {
    await Database.insert('observations', observation.toJson);
    final List<Streak> streaks = List.from(state);
    final Streak originStreak =
        streaks.firstWhere((streak) => streak.id == observation.streakId);
    streaks[streaks.indexOf(originStreak)] = originStreak.copyWith(
      observations: originStreak.observations..add(observation),
    );
    emit(streaks);
  }

  void resetStreak(int streakId) async {
    await Database.insert(
      'times_resetted',
      {
        'streak_id': streakId,
        'date_of_reset':
            DateFormat('dd/MM/yyyy-HH:mm:ss').format(DateTime.now()),
      },
    );
    emit(await DatabaseHelper.selectStreaks());
  }

  void deleteStreak(int streakId) async {
    await Database.delete('streaks', {'id': streakId});
    emit(await DatabaseHelper.selectStreaks());
  }
}
