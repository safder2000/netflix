import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../widgets/icon_button_widget.dart';

class EveryoneWatching extends StatelessWidget {
  const EveryoneWatching({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final srcWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: srcWidth,
      // height: srcWidth * 1.05,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/3UbHGmu9vIMSC5uNfnGt7DjetqT.jpg',
                  ),
                ),
              ),
              width: srcWidth,
              height: srcWidth * 0.56,
            ),
            Positioned(
              right: 10,
              bottom: 15,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.black26,
                child: Icon(
                  Icons.volume_mute_outlined,
                  color: whiteColor,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                    child: Image.network(
                        'https://occ-0-299-990.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABYWW06_AXMSVM49APTcThb2CkqC-StVw6Utdsov1YHHzlqhXP9L834vsICkqEmIeu9eaJ9HOPNQ4D7cBbURv4iFdcgdgQinUAm-EMHcFlNs-yRzbNRNkAmzdny8POh2sRKpWSaKyqZmMGurnwciVPvXz0fxhl_1aXyvvCOnfajV3fwxczBUbgQ.png?r=cc7'),
                  ),
                  IconButtonwidget(
                    title: 'Share',
                    icon: Icons.share,
                    fontSize: 9,
                    iconSize: 25,
                    fontColor: grayColor,
                    iconColor: Colors.grey.shade200,
                  ),
                  IconButtonwidget(
                    title: 'My List',
                    iconSize: 29,
                    icon: Icons.check,
                    fontSize: 9,
                    fontColor: grayColor,
                    iconColor: Colors.grey.shade200,
                  ),
                  IconButtonwidget(
                    title: 'Play',
                    iconSize: 31,
                    icon: Icons.play_arrow,
                    fontSize: 9,
                    fontColor: grayColor,
                    iconColor: Colors.grey.shade200,
                  ),
                ],
              ),
              height_10,
              height_10,
              Text(
                'In a dystropia with correption and cybernetic implants, a talented but recless street kid strives to become a mersonary outlow - an edgerunner',
                style: hotnNewTabText,
              ),
              height_10,
              Text(
                'Deadpan . Rousing . Superhero . Superpower . Japanese',
                style:
                    TextStyle(fontSize: 12, color: Colors.white, height: 1.7),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
