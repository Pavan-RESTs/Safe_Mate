import 'package:flutter/material.dart';

import '../../../../core/constants/image_strings.dart';
import '../../../../core/device/device_utility.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String info;
  final String? metric;
  final String imagePath;
  final bool isAlert;

  const InfoCard({
    super.key,
    required this.title,
    required this.info,
    required this.metric,
    required this.imagePath,
    required this.isAlert,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isAlert ? Colors.red : const Color(0xffd8d8d8);
    final Color backgroundColor = isAlert ? Colors.red.shade50 : Colors.white;

    return Material(
      elevation: 6,
      color: backgroundColor,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: IDeviceUtility.getScreenWidth() * 0.425,
        height: IDeviceUtility.getScreenHeight() * 0.26,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: borderColor,
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
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: isAlert ? Colors.red : Colors.black,
                    ),
                  ),
                  Image.asset(IImageStrings.threeDotIcon)
                ],
              ),
              Image.asset(
                imagePath,
                width: 75,
              ),
              Text(
                "$info ${metric ?? ''}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: isAlert ? Colors.red : Colors.black,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  backgroundColor: isAlert ? Colors.red : null,
                ),
                onPressed: () {},
                child: Text(
                  "View Report",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: isAlert ? Colors.white : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
