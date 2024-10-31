import 'package:flutter/cupertino.dart';

import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';
import '../device_info_card.dart';

class DeviceInfoDashboard extends StatelessWidget {
  const DeviceInfoDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DeviceInfoCard(
            image: IImageStrings.wearStatusIcon,
            title: ITextStrings.wearStatus,
            value: ITextStrings.active),
        DeviceInfoCard(
          image: IImageStrings.batteryIcon,
          title: ITextStrings.battery,
          value: ITextStrings.standBy,
          isBattery: true,
        )
      ],
    );
  }
}
