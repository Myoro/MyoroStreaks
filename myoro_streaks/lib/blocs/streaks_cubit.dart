import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_streaks/database.dart';
import 'package:myoro_streaks/models/streak.dart';

class StreaksCubit extends Cubit<List<Streak>> {
  StreaksCubit(super.streaks);

  void add(Streak streak) {
    Database.insert('streaks', streak.toJson);
    emit(state..add(streak));
  }
}
