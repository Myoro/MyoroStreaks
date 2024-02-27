import 'package:flutter/material.dart';
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

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseModal(
        size: const Size(300, 300),
        showFooterButtons: true,
        content: Column(
          children: [
            BaseTextFieldForm(
              title: 'Name of Streak',
              textFieldWidth: 200,
              obligatory: true,
              controller: _nameController,
            ),
          ],
        ),
      );
}
