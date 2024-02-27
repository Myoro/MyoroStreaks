import 'package:flutter/material.dart';
import 'package:myoro_streaks/enums/size_enum.dart';

class IconButtonWithoutFeedback extends StatelessWidget {
  final SizeEnum sizeEnum;
  final IconData icon;
  final Function onTap;

  const IconButtonWithoutFeedback({
    super.key,
    this.sizeEnum = SizeEnum.medium,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    late final double size;

    switch (sizeEnum) {
      case SizeEnum.small:
        size = 20;
        break;
      case SizeEnum.medium:
        size = 40;
        break;
      case SizeEnum.large:
        size = 60;
        break;
    }

    return InkWell(
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
}
