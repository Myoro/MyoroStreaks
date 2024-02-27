import 'dart:math';

import 'package:intl/intl.dart';
import 'package:myoro_streaks/models/observation.dart';

class Streak {
  final int id;
  final String name;
  final DateTime startDate;

  /// Times the user has reset the streak
  final List<DateTime> timesResetted;

  /// Observations of changes user user observes progressing their streak
  final List<Observation> observations;

  const Streak({
    required this.id,
    required this.name,
    required this.startDate,
    required this.timesResetted,
    required this.observations,
  });

  Streak.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        startDate = DateFormat('dd/MM/yyyy-HH:mm:ss').parse(json['start_date']),
        timesResetted = List.generate(
          json['times_resetted'].length,
          (i) => DateFormat('dd/MM/yyyy-HH:mm:ss')
              .parse(json['times_resetted'][i]),
        ),
        observations = List.generate(
          json['observations'].length,
          (i) => Observation.fromJson(json['observations'][i]),
        );

  Map<String, dynamic> get toJson => {
        'id': id,
        'name': name,
        'start_date': DateFormat('dd/MM/yyyy-HH:mm:ss').format(startDate),
        'times_resetted': List.generate(
          timesResetted.length,
          (i) => DateFormat('dd/MM/yyyy-HH:mm:ss').format(timesResetted[i]),
        ),
        'observations': List.generate(
          observations.length,
          (i) => observations[i].toJson,
        ),
      };

  @override
  String toString() => '''
    Streak(
      id: $id,
      name: $name,
      startDate: $startDate,
      timesResetted: $timesResetted,
      observations: $observations,
    );
  ''';

  static Streak get sampleStreak => Streak(
        id: 0,
        name: 'Empty',
        startDate: DateTime.now(),
        timesResetted: List.generate(
          Random().nextInt(10),
          (i) => DateTime.now(),
        ),
        observations: List.generate(
          Random().nextInt(10),
          (i) => Observation.sampleObservation,
        ),
      );
}
