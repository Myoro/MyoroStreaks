import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) => const BaseModal(
        size: Size(300, 300),
        showFooterButtons: true,
        content: Text('Start'),
      );
}
