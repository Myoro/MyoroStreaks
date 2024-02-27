import 'package:flutter/material.dart';
import 'package:myoro_streaks/enums/size_enum.dart';

class BaseOutput extends StatelessWidget {
  final SizeEnum sizeEnum;
  final String title;
  final String output;

  const BaseOutput({
    super.key,
    this.sizeEnum = SizeEnum.medium,
    required this.title,
    required this.output,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    late final TextStyle titleTextStyle;
    late final TextStyle outputTextStyle;

    switch (sizeEnum) {
      case SizeEnum.small:
        titleTextStyle = textTheme.titleSmall!;
        outputTextStyle = textTheme.bodySmall!;
        break;
      case SizeEnum.medium:
        titleTextStyle = textTheme.titleMedium!;
        outputTextStyle = textTheme.bodyMedium!;
        break;
      case SizeEnum.large:
        titleTextStyle = textTheme.titleLarge!;
        outputTextStyle = textTheme.bodyLarge!;
        break;
    }

    return Wrap(
      spacing: 10,
      alignment: WrapAlignment.center,
      children: [
        Text(
          '$title:',
          textAlign: TextAlign.center,
          style: titleTextStyle,
        ),
        Text(
          output,
          textAlign: TextAlign.center,
          style: outputTextStyle,
        ),
      ],
    );
  }
}
