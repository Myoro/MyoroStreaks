import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:myoro_streaks/blocs/streaks_cubit.dart';
import 'package:myoro_streaks/enums/border_style_enum.dart';
import 'package:myoro_streaks/models/observation.dart';
import 'package:myoro_streaks/models/streak.dart';
import 'package:myoro_streaks/widgets/inputs/base_text_field.dart';
import 'package:myoro_streaks/widgets/modals/base_modal.dart';

class ObservationFormModal extends StatefulWidget {
  final Streak streak;

  const ObservationFormModal({super.key, required this.streak});

  static void show(BuildContext context, Streak streak) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => ObservationFormModal(streak: streak),
      );

  @override
  State<ObservationFormModal> createState() => _ObservationFormModalState();
}

class _ObservationFormModalState extends State<ObservationFormModal> {
  final TextEditingController _controller = TextEditingController();

  void _createObservation() {
    BlocProvider.of<StreaksCubit>(context).addObservation(Observation(
      streakId: widget.streak.id!,
      observation: _controller.text,
      dateCreated: DateTime.now(),
    ));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseModal(
        size: const Size(300, 329),
        title: 'Add Observation',
        showFooterButtons: true,
        yesOnTap: () => _createObservation(),
        content: Column(
          children: [
            BaseTextField(
              height: 200,
              borderStyleEnum: BorderStyleEnum.rounded,
              controller: _controller,
            ),
            const SizedBox(height: 3),
            Text(
              'Observation for ${DateFormat('dd/MM/yyyy').format(DateTime.now())}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      );
}
