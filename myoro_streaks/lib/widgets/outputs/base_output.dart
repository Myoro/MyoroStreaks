import 'package:flutter/material.dart';

class BaseOutput extends StatelessWidget {
  final String title;
  final String output;

  const BaseOutput({
    super.key,
    required this.title,
    required this.output,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Wrap(
      spacing: 10,
      alignment: WrapAlignment.center,
      children: [
        Text(
          '$title:',
          textAlign: TextAlign.center,
          style: textTheme.titleMedium,
        ),
        Text(
          output,
          textAlign: TextAlign.center,
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
