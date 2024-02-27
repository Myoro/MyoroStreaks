import 'package:flutter/material.dart';
import 'package:myoro_streaks/enums/size_enum.dart';
import 'package:myoro_streaks/widgets/inputs/base_text_field.dart';

class BaseTextFieldForm extends StatelessWidget {
  final String title;
  final SizeEnum sizeEnum;
  final double? textFieldWidth;
  final bool obligatory;
  final TextEditingController? controller;

  const BaseTextFieldForm({
    super.key,
    required this.title,
    this.sizeEnum = SizeEnum.medium,
    this.textFieldWidth,
    this.obligatory = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    late final TextStyle titleTextStyle;

    switch (sizeEnum) {
      case SizeEnum.small:
        titleTextStyle = Theme.of(context).textTheme.titleSmall!;
        break;
      case SizeEnum.medium:
        titleTextStyle = Theme.of(context).textTheme.titleMedium!;
        break;
      case SizeEnum.large:
        titleTextStyle = Theme.of(context).textTheme.titleLarge!;
        break;
    }

    return Row(
      children: [
        Text('${obligatory ? '* ' : ''}$title:', style: titleTextStyle),
        const SizedBox(width: 10),
        BaseTextField(
          sizeEnum: sizeEnum,
          width: textFieldWidth,
          controller: controller,
        ),
      ],
    );
  }
}
