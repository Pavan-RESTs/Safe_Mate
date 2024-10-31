import 'package:flutter/cupertino.dart';

import '../../../../../core/constants/image_strings.dart';
import '../info_card.dart';

class InfoDashboard extends StatelessWidget {
  const InfoDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoCard(
              title: 'Heart Rate',
              info: '84',
              metric: 'bpm',
              imagePath: IImageStrings.heartRateIcon,
            ),
            InfoCard(
              title: 'Temperature',
              info: '36',
              metric: '°C',
              imagePath: IImageStrings.temperatureIcon,
            ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoCard(
              title: 'Position',
              info: 'Standing',
              metric: '',
              imagePath: IImageStrings.positionIcon,
            ),
            InfoCard(
              title: 'Fall',
              info: '-',
              metric: '-',
              imagePath: IImageStrings.fallIcon,
            ),
          ],
        )
      ],
    );
  }
}
