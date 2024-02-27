import 'dart:math';

import 'package:intl/intl.dart';

class Observation {
  final String observation;
  final DateTime dateCreated;

  const Observation({required this.observation, required this.dateCreated});

  Observation.fromJson(Map<String, dynamic> json)
      : observation = json['observation'],
        dateCreated =
            DateFormat('dd/MM/yyyy-HH:mm:ss').parse(json['date_created']);

  Map<String, dynamic> get toJson => {
        'observation': observation,
        'date_created': DateFormat('dd/MM/yyyy-HH:mm:ss').format(dateCreated),
      };

  @override
  String toString() => '''
    Observation(
      observation: $observation,
      dateCreated: $dateCreated,
    );
  ''';

  static Observation get sampleObservation => Observation(
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
