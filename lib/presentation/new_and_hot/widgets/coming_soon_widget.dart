import 'package:flutter/material.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../widgets/icon_button_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final srcWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: srcWidth * 0.15,
          child: Column(children: [
            Text('OCT',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade200)),
            Text(
              '10',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ]),
        ),
        SizedBox(
          width: srcWidth * 0.85,
          height: srcWidth * 1.1,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  width: srcWidth * 0.85,
                  height: srcWidth * 0.45,
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
            height_10,
            Row(
              children: [
                SizedBox(
                  height: 50,
                  child: Image.network(
                      'https://occ-0-299-990.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABYWW06_AXMSVM49APTcThb2CkqC-StVw6Utdsov1YHHzlqhXP9L834vsICkqEmIeu9eaJ9HOPNQ4D7cBbURv4iFdcgdgQinUAm-EMHcFlNs-yRzbNRNkAmzdny8POh2sRKpWSaKyqZmMGurnwciVPvXz0fxhl_1aXyvvCOnfajV3fwxczBUbgQ.png?r=cc7'),
                ),
                Spacer(),
                IconButtonwidget(
                  title: 'Remind Me',
                  icon: Icons.notifications_none_outlined,
                  fontSize: 9,
                  iconSize: 25,
                  fontColor: grayColor,
                  iconColor: Colors.grey.shade200,
                ),
                width_10,
                width_10,
                IconButtonwidget(
                  title: 'info',
                  iconSize: 25,
                  icon: Icons.info_outline,
                  fontSize: 9,
                  fontColor: grayColor,
                  iconColor: Colors.grey.shade200,
                ),
                width_10,
                width_10,
              ],
            ),
            height_10,
            height_10,
            height_10,
            Text(
              'Season Coming On 10 OCT',
              style: hotnNewTabTitle,
            ),
            height_10,
            Text(
              'In a dystropia with correption and cybernetic implants, a talented but recless street kid strives to become a mersonary outlow - an edgerunner',
              style: hotnNewTabText,
            ),
          ]),
        ),
      ],
    );
  }
}
