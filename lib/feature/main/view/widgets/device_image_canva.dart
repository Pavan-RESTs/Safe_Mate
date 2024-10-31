import 'package:flutter/cupertino.dart';

import '../../../../core/constants/image_strings.dart';
import '../../../../core/device/device_utility.dart';

class DeviceImageCanva extends StatelessWidget {
  const DeviceImageCanva({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: IDeviceUtility.getScreenHeight() * 0.12,
          right: IDeviceUtility.getScreenWidth() * 0.16,
          child: Image.asset(IImageStrings.deviceImageBlur),
        ),
        Image.asset(IImageStrings.deviceImage),
      ],
    );
  }
}
