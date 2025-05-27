// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class BuildLabel extends StatelessWidget {
  final String text;
  final TextTheme textStyle;
  const BuildLabel({super.key, required this.text, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: textStyle.labelLarge!.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
