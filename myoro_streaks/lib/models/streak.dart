import 'dart:math';

import 'package:intl/intl.dart';
import 'package:myoro_streaks/models/observation.dart';

class Streak {
  final int? id;
  final String name;
  final DateTime startDate;

  /// Times the user has reset the streak
  final List<DateTime> timesResetted;

  /// Observations of changes user user observes progressing their streak
  final List<Observation> observations;

  const Streak({
    this.id,
    required this.name,
    required this.startDate,
    required this.timesResetted,
    required this.observations,
  });

  Streak.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        startDate = DateFormat('dd/MM/yyyy-HH:mm:ss').parse(json['start_date']),
        timesResetted = [],
        observations = [];

  Map<String, dynamic> get toJson => {
        'id': id,
        'name': name,
        'start_date': DateFormat('dd/MM/yyyy-HH:mm:ss').format(startDate),
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

  Streak copyWith({
    int? id,
    String? name,
    DateTime? startDate,
    List<DateTime>? timesResetted,
    List<Observation>? observations,
  }) =>
      Streak(
        id: id ?? this.id,
        name: name ?? this.name,
        startDate: startDate ?? this.startDate,
        timesResetted: timesResetted ?? this.timesResetted,
        observations: observations ?? this.observations,
      );

  static Streak get sampleStreak => Streak(
        id: 0,
        name: 'Empty',
        startDate: DateTime.now().subtract(const Duration(days: 30)),
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
