import 'package:flutter/material.dart';
import 'package:myoro_streaks/enums/border_style_enum.dart';
import 'package:myoro_streaks/enums/size_enum.dart';

class BaseTextField extends StatelessWidget {
  final SizeEnum sizeEnum;
  final BorderStyleEnum borderStyleEnum;
  final double? width;
  final double? height;
  final TextEditingController? controller;

  const BaseTextField({
    super.key,
    this.sizeEnum = SizeEnum.medium,
    this.borderStyleEnum = BorderStyleEnum.underline,
    this.width,
    this.height,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    late final InputBorder border;
    late final double finalHeight;
    // Height needs to be decided here for the text to not looking offsetted
    late final TextStyle textStyle;

    switch (sizeEnum) {
      case SizeEnum.small:
        finalHeight = height ?? 40;
        textStyle = theme.textTheme.bodySmall!;
        break;
      case SizeEnum.medium:
        finalHeight = height ?? 50;
        textStyle = theme.textTheme.bodyMedium!;
        break;
      case SizeEnum.large:
        finalHeight = height ?? 60;
        textStyle = theme.textTheme.bodyLarge!;
        break;
    }

    switch (borderStyleEnum) {
      case BorderStyleEnum.underline:
        border = UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.colorScheme.onPrimary,
            width: 2,
          ),
        );
        break;
      case BorderStyleEnum.rounded:
        border = OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: theme.colorScheme.onPrimary,
            width: 2,
          ),
        );
        break;
    }

    return SizedBox(
      width: width,
      height: finalHeight,
      child: TextField(
        maxLines: height != null ? 10 : 1,
        controller: controller,
        style: textStyle,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding:
              height != null ? const EdgeInsets.all(10) : EdgeInsets.zero,
          focusedBorder: border,
          enabledBorder: border,
        ),
      ),
    );
  }
}
