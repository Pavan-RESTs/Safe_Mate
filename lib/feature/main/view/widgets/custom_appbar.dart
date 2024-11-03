import 'package:client/core/constants/text_strings.dart';
import 'package:client/core/device/device_utility.dart';
import 'package:client/feature/main/view/pages/collect_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/image_strings.dart';
import '../../../../core/theme/pallete.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: IPallete.primaryBlue,
        flexibleSpace: Stack(
          children: [
            Positioned(
              top: IDeviceUtility.getAppBarHeight() * 1.3,
              left: IDeviceUtility.getScreenWidth() * 0.01,
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Iconsax.textalign_justifycenter,
                      color: Colors.white,
                    ),
                    onPressed: () => Get.to(const CollectData()),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    IImageStrings.profileImage,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ITextStrings.hello,
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        ITextStrings.rahulRangaratham,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
                      )
                    ],
                  ),
                  SizedBox(
                    width: IDeviceUtility.getScreenWidth() * 0.14,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Iconsax.notification,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: IDeviceUtility.getScreenWidth() * 0.04,
                      ),
                      const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(IDeviceUtility.getScreenHeight() * 0.14);
}
