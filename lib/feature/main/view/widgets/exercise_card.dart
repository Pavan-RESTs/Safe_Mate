import 'package:flutter/material.dart';

import '../../../../core/constants/image_strings.dart';
import '../../../../core/device/device_utility.dart';

class ExerciseCard extends StatelessWidget {
  final String date;
  final String month;
  final String title;
  final String sets;
  final String startAndEnd;
  final Color bgColor;
  final VoidCallback? onPressed;
  const ExerciseCard({
    super.key,
    required this.date,
    required this.month,
    required this.title,
    required this.sets,
    required this.startAndEnd,
    required this.bgColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: IDeviceUtility.getScreenHeight() * 0.135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: bgColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        month,
                        style: const TextStyle(
                          color: Color(0xff7e7c7c),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Completed : $sets sets",
                      style: const TextStyle(
                        color: Color(0xff7e7c7c),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onPressed,
                  child: Image.asset(
                    IImageStrings.arrowRight,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              startAndEnd,
              style: const TextStyle(
                color: Color(0xff444444),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
