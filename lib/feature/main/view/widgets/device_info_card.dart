import 'package:client/core/device/device_utility.dart';
import 'package:flutter/material.dart';

class DeviceInfoCard extends StatelessWidget {
  final String image;
  final String title;
  final String value;
  final bool isBattery;
  const DeviceInfoCard({
    super.key,
    required this.image,
    required this.title,
    required this.value,
    this.isBattery = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: IDeviceUtility.getScreenWidth() * 0.43,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xff949494))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                image,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              if (isBattery)
                const Text(
                  "72%",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}
