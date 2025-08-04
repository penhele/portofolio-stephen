import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SelectableText(title, style: Theme.of(context).textTheme.titleLarge);
  }
}
