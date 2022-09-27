import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/presentation/widgets/profilePic.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key, required this.title, required this.icon});
  String title;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        width_10,
        Text(
          title,
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Icon(
          icon,
          size: 26,
          color: Colors.white,
        ),
        width_10,
        width_10,
        width_10,
        ProfilePick(),
        width_10,
        width_10,
      ],
    );
  }
}
