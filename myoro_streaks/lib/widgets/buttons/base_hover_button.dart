import 'package:flutter/material.dart';

/// Hover button that can hold an [Icon], [Text], or both
class BaseHoverButton extends StatefulWidget {
  final Function onTap;
  final IconData? icon;
  final double? iconSize;
  final String? text;
  final bool bordered;

  BaseHoverButton({
    super.key,
    required this.onTap,
    this.icon,
    this.iconSize,
    this.text,
    this.bordered = false,
  }) {
    assert((icon != null && iconSize != null) || text != null);
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

    return ValueListenableBuilder(
      valueListenable: _hovered,
      builder: (context, hovered, child) => InkWell(
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
                  size: widget.iconSize,
                  color: !hovered
                      ? theme.colorScheme.onPrimary
                      : theme.colorScheme.primary,
                ),
              if (widget.icon != null && widget.text != null)
                const SizedBox(width: 5),
              if (widget.text != null)
                Text(
                  widget.text!,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: !hovered
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.primary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
