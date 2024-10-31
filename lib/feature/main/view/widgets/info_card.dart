import 'package:client/core/device/device_utility.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/image_strings.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String info;
  final String? metric;
  final String imagePath;
  const InfoCard({
    super.key,
    required this.title,
    required this.info,
    required this.metric,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 6,
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: IDeviceUtility.getScreenWidth() * 0.425,
        height: IDeviceUtility.getScreenHeight() * 0.26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: const Color(0xffd8d8d8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Image.asset(IImageStrings.threeDotIcon)
                ],
              ),
              Image.asset(
                imagePath,
                width: 75,
              ),
              Text(
                "$info $metric",
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "View Report",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
