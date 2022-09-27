import 'package:flutter/material.dart';

import '../../core/colors.dart';

class IconButtonwidget extends StatelessWidget {
  const IconButtonwidget({
    Key? key,
    required this.title,
    this.fontSize = 10,
    this.iconSize = 29,
    this.fontColor = whiteColor,
    this.iconColor = whiteColor,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final double? fontSize;
  final double? iconSize;
  final Color? fontColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: fontSize, color: fontColor),
        )
      ],
    );
  }
}
