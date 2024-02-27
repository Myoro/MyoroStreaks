import 'package:flutter/material.dart';

/// Always use this [Widget] when creating a new [Scaffold] body
class BaseBody extends StatelessWidget {
  final List<Widget> children;

  const BaseBody({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          children: children,
        ),
      );
}
