import 'package:client/core/constants/image_strings.dart';
import 'package:client/core/constants/text_strings.dart';
import 'package:client/core/theme/pallete.dart';
import 'package:client/feature/main/view/widgets/custom_titlebar.dart';
import 'package:client/feature/main/view/widgets/mini_elevated_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/device/device_utility.dart';
import '../widgets/builders/device_info_dashboard.dart';
import '../widgets/canva_dot_incicator.dart';
import '../widgets/device_image_canva.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            IDeviceUtility.getScreenWidth() * 0.05,
            IDeviceUtility.getAppBarHeight() * 1.2,
            IDeviceUtility.getScreenWidth() * 0.05,
            0),
        child: const Column(
          children: [
            CustomTitleBar(
              title: ITextStrings.deviceInfo,
              actionWidget: Text(
                ITextStrings.deviceId,
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                    decorationThickness: 2,
                    decorationColor: Color(0xffa5a5a5),
                    color: Color(0xffa5a5a5)),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            DeviceImageCanva(),
            SizedBox(
              height: 15,
            ),
            DotIndicator(),
            SizedBox(
              height: 12,
            ),
            Divider(
              thickness: 1.05,
            ),
            SizedBox(
              height: 15,
            ),
            CustomTitleBar(
              title: ITextStrings.status,
              mediumFont: true,
            ),
            SizedBox(
              height: 10,
            ),
            DeviceInfoDashboard(),
            SizedBox(
              height: 20,
            ),
            CustomTitleBar(
              title: ITextStrings.deviceLocation,
              mediumFont: true,
              actionWidget: MiniElevatedButton(
                color: IPallete.primaryGreen,
                buttonId: ITextStrings.trackDevice,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            MapView()
          ],
        ),
      ),
    ));
  }
}

class MapView extends StatelessWidget {
  const MapView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(IImageStrings.mapImage),
        ),
        Positioned(
          top: IDeviceUtility.getScreenWidth() * 0.15,
          left: IDeviceUtility.getScreenWidth() * 0.3,
          child: Image.asset(IImageStrings.currentLocation),
        ),
      ],
    );
  }
}
