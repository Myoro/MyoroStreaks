import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myoro_streaks/models/observation.dart';
import 'package:myoro_streaks/models/streak.dart';
import 'package:myoro_streaks/widgets/cards/base_card.dart';
import 'package:myoro_streaks/widgets/dividers/horizontal_divider.dart';
import 'package:myoro_streaks/widgets/outputs/base_output.dart';

class StreakCard extends StatefulWidget {
  final Streak streak;

  const StreakCard({super.key, required this.streak});

  @override
  State<StreakCard> createState() => _StreakCardState();
}

class _StreakCardState extends State<StreakCard> {
  late final Timer _timer;
  ValueNotifier<String>? _dateSinceStartDate;

  void _setDateSinceStartDate() {
    final Duration difference =
        DateTime.now().difference(widget.streak.startDate);
    final String dateSinceStartDate =
        '${difference.inDays} Days, ${difference.inHours} Hours, ${difference.inMinutes.remainder(60)} Minutes, and ${difference.inSeconds.remainder(60)} Seconds';

    if (_dateSinceStartDate == null) {
      _dateSinceStartDate = ValueNotifier<String>(dateSinceStartDate);
    } else {
      _dateSinceStartDate?.value = dateSinceStartDate;
    }
  }

  @override
  void initState() {
    super.initState();

    _setDateSinceStartDate();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _setDateSinceStartDate(),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseCard(
        title: widget.streak.name,
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: _dateSinceStartDate!,
              builder: (context, dateSinceStartDate, child) => BaseOutput(
                title: 'Time since start date',
                output: dateSinceStartDate,
              ),
            ),
            const HorizontalDivider(),
            BaseOutput(
              title: 'Start date',
              output: DateFormat('dd/MM/yyyy-HH:mm:ss')
                  .format(widget.streak.startDate),
            ),
            const HorizontalDivider(),
            BaseOutput(
              title: 'Times ${widget.streak.name} was reset',
              output: widget.streak.timesResetted.length.toString(),
            ),
            const HorizontalDivider(),
            Column(
              children: [
                Text(
                  'Observations',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      for (final Observation observation
                          in widget.streak.observations) ...[
                        Text(
                          DateFormat('dd/MM/yyyy')
                              .format(observation.dateCreated),
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          observation.observation,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        if (widget.streak.observations.indexOf(observation) !=
                            widget.streak.observations.length - 1)
                          const HorizontalDivider(),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
