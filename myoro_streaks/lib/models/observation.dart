import 'dart:math';

import 'package:intl/intl.dart';

class Observation {
  final int? id;
  final int streakId;
  final String observation;
  final DateTime dateCreated;

  const Observation({
    this.id,
    required this.streakId,
    required this.observation,
    required this.dateCreated,
  });

  Observation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        observation = json['observation'],
        streakId = json['streak_id'],
        dateCreated =
            DateFormat('dd/MM/yyyy-HH:mm:ss').parse(json['date_created']);

  Map<String, dynamic> get toJson => {
        'id': id,
        'streak_id': streakId,
        'observation': observation,
        'date_created': DateFormat('dd/MM/yyyy-HH:mm:ss').format(dateCreated),
      };

  @override
  String toString() => '''
    Observation(
      id: $id,
      streakId: $streakId,
      observation: $observation,
      dateCreated: $dateCreated,
    );
  ''';

  static Observation get sampleObservation => Observation(
        id: 0,
        streakId: 0,
        observation: [
          'Bingo oiqjweoijweoijwqelwjewqjeowqjeowqjeowejwqoiejwqoiejqoiejwqoiejqwoiejwqoiejwqoiejwqoiewqjeoiwqjeoij',
          'Bango oqjweiwqj oiqjwe iqjwe oqjwoie jqe qiwjeo qjwoejq oeiqjwoie jqwoiej qoeij',
          'Bongo oqijeoqiwjeoiwqje;owqijeoqwje oqijweoiwqj eoiqjweoiqjweoiwqje oiqwje oiwqjeoiqwj eoiwqje qoie jo',
          'Bishqwjeqwoie jqowiej qowiejowqije oqwje oiwqje oiwqje owqijewqoijewqoiejwqoiejwqoije qowiej qoijeqwoi j',
          'Bash qpojepwqjeoiwqj eoiqjweoi jwqeoi jqweoiwqjeoijwqe oiqwjeoiwqje qoiwjeq oije',
          'Bosh',
        ][Random().nextInt(6)],
        dateCreated: DateTime.now(),
      );
}
