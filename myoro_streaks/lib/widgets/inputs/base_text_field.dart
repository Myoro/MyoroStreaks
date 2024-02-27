import 'package:flutter/material.dart';
import 'package:myoro_streaks/enums/size_enum.dart';

class BaseTextField extends StatelessWidget {
  final SizeEnum sizeEnum;
  final double? width;
  final TextEditingController? controller;

  const BaseTextField({
    super.key,
    this.sizeEnum = SizeEnum.medium,
    this.width,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final UnderlineInputBorder border = UnderlineInputBorder(
      borderSide: BorderSide(
        color: theme.colorScheme.onPrimary,
        width: 2,
      ),
    );

    // Height needs to be decided here for the text to not looking offsetted
    late final double height;

    switch (sizeEnum) {
      case SizeEnum.small:
        height = 40;
        break;
      case SizeEnum.medium:
        height = 50;
        break;
      case SizeEnum.large:
        height = 60;
        break;
    }

    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          focusedBorder: border,
          enabledBorder: border,
        ),
      ),
    );
  }
}
