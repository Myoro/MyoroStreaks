import 'package:flutter/material.dart';
import 'package:myoro_streaks/widgets/buttons/base_hover_button.dart';
import 'package:myoro_streaks/widgets/modals/streak_form_modal.dart';

/// Every modal derives off this widget
///
/// Always use [showDialog] within the modal class, not where the modal is being used
/// Look at any file in this directory, such as [StreakFormModal], for clarification
class BaseModal extends StatelessWidget {
  final Size size;
  final String? title;
  final bool showFooterButtons;
  final Function? yesOnTap;
  final Widget content;

  BaseModal({
    super.key,
    required this.size,
    this.title,
    this.showFooterButtons = false,
    this.yesOnTap,
    required this.content,
  }) {
    assert(showFooterButtons && yesOnTap != null);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Center(
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: theme.colorScheme.onPrimary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Material(
            // So that we may use custom widgets (like [BaseHoverButton]) in the modal
            child: Column(
              children: [
                Row(
                  children: [
                    if (title != null)
                      Text(
                        title!,
                        style: theme.textTheme.titleMedium,
                      ),
                    const Spacer(),
                    BaseHoverButton(
                      onTap: () => Navigator.pop(context),
                      icon: Icons.close,
                      iconSize: 30,
                    ),
                  ],
                ),
                content,
                const SizedBox(height: 10),
                if (showFooterButtons) ...[
                  Row(
                    children: [
                      Expanded(
                        child: BaseHoverButton(
                          onTap: () => Navigator.pop(context),
                          text: 'Confirm',
                          bordered: true,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: BaseHoverButton(
                          onTap: () => Navigator.pop(context),
                          text: 'Cancel',
                          bordered: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
