import 'package:flutter/material.dart';
import 'package:myoro_streaks/enums/size_enum.dart';

/// Hover button that can hold an [Icon], [Text], or both
class BaseHoverButton extends StatefulWidget {
  final SizeEnum sizeEnum;
  final Function onTap;
  final IconData? icon;
  final String? text;
  final bool bordered;
  final String? tooltip;

  BaseHoverButton({
    super.key,
    this.sizeEnum = SizeEnum.medium,
    required this.onTap,
    this.icon,
    this.text,
    this.bordered = false,
    this.tooltip,
  }) {
    assert(icon != null || text != null);
  }

  @override
  State<BaseHoverButton> createState() => _BaseHoverButtonState();
}

class _BaseHoverButtonState extends State<BaseHoverButton> {
  final ValueNotifier<bool> _hovered = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _hovered.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    late final TextStyle textStyle;
    late final double iconSize;

    switch (widget.sizeEnum) {
      case SizeEnum.small:
        textStyle = theme.textTheme.bodySmall!;
        iconSize = 20;
        break;
      case SizeEnum.medium:
        textStyle = theme.textTheme.bodyMedium!;
        iconSize = 40;
        break;
      case SizeEnum.large:
        textStyle = theme.textTheme.bodyLarge!;
        iconSize = 60;
        break;
    }

    return ValueListenableBuilder(
      valueListenable: _hovered,
      builder: (context, hovered, child) => Tooltip(
        message: widget.tooltip ?? '',
        child: InkWell(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => widget.onTap(),
          onHover: (value) => _hovered.value = value,
          child: Container(
            decoration: BoxDecoration(
                color:
                    !hovered ? Colors.transparent : theme.colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(10),
                border: widget.bordered
                    ? Border.all(
                        color: theme.colorScheme.onPrimary,
                        width: 2,
                      )
                    : null),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null)
                  Icon(
                    widget.icon,
                    size: iconSize,
                    color: !hovered
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.primary,
                  ),
                if (widget.icon != null && widget.text != null)
                  const SizedBox(width: 5),
                if (widget.text != null)
                  Text(
                    widget.text!,
                    style: textStyle.copyWith(
                      color: !hovered
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.primary,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
