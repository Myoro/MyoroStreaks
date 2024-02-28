import 'package:flutter/material.dart';
import 'package:myoro_streaks/widgets/modals/base_modal.dart';

class ConfirmationModal extends StatelessWidget {
  final String message;
  final Function yesOnTap;
  final double height;

  const ConfirmationModal({
    super.key,
    required this.message,
    required this.yesOnTap,
    required this.height,
  });

  static void show(
    BuildContext context, {
    required String message,
    required Function yesOnTap,
    required double height,
  }) =>
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => ConfirmationModal(
          message: message,
          yesOnTap: yesOnTap,
          height: height,
        ),
      );

  @override
  Widget build(BuildContext context) => BaseModal(
        size: const Size(300, 300),
        showFooterButtons: true,
        yesOnTap: () => yesOnTap(),
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      );
}
