import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myoro_streaks/blocs/streaks_cubit.dart';
import 'package:myoro_streaks/models/streak.dart';
import 'package:myoro_streaks/widgets/inputs/base_text_field_form.dart';
import 'package:myoro_streaks/widgets/modals/base_modal.dart';

class StreakFormModal extends StatefulWidget {
  const StreakFormModal({super.key});

  static void show(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const StreakFormModal(),
      );

  @override
  State<StreakFormModal> createState() => _StreakFormModalState();
}

class _StreakFormModalState extends State<StreakFormModal> {
  final TextEditingController _nameController = TextEditingController();

  void _createStreak() {
    BlocProvider.of<StreaksCubit>(context).addStreak(
      Streak(
        name: _nameController.text,
        startDate: DateTime.now(),
        timesResetted: [],
        observations: [],
      ),
    );

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseModal(
        size: const Size(330, 150),
        title: 'Create a new streak',
        showFooterButtons: true,
        yesOnTap: () => _createStreak(),
        content: Column(
          children: [
            BaseTextFieldForm(
              title: 'Name of Streak',
              textFieldWidth: 135,
              controller: _nameController,
            ),
          ],
        ),
      );
}
