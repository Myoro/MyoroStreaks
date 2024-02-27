import 'package:flutter/material.dart';

class IconButtonWithoutFeedback extends StatelessWidget {
  final IconData icon;
  final double size;
  final Function onTap;

  const IconButtonWithoutFeedback({
    super.key,
    required this.icon,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    hoverColor: Colors.transparent,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () => onTap(),
    child: Icon(
      icon,
      size: size,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
  );
}
