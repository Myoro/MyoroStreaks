import 'package:flutter/material.dart';

class VerticalDivider extends StatelessWidget {
  const VerticalDivider({ super.key });

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Container(
      width: 0.5,
      height: double.infinity,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
  );
}