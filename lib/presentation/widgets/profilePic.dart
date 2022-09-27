import 'package:flutter/material.dart';

import '../../core/constants.dart';

class ProfilePick extends StatelessWidget {
  const ProfilePick({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        borderRadius: Radius_5,
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://mir-s3-cdn-cf.behance.net/project_modules/disp/1bdc9a33850498.56ba69ac2ba5b.png'),
        ),
      ),
    );
  }
}
