import 'package:flutter/material.dart';

import '../../../../core/constants/image_strings.dart';

class ShadedImageWithControls extends StatelessWidget {
  final String image;
  final bool showControls;
  final double width;
  final double height;
  final double borderRadius;
  const ShadedImageWithControls({
    super.key,
    required this.image,
    this.showControls = false,
    required this.width,
    required this.height,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image(
            image: AssetImage(image),
          ),
        ),
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.8), Colors.transparent]),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        if (showControls)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white54.withOpacity(0.2),
                      border: Border.all(
                        width: 2,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(28)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: const Text(
                    "Day 15",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  "Otago",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: Colors.white),
                ),
                const Text(
                  "For better strength",
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Color(0xff98979A)),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(IImageStrings.timerIcon),
                        const Text(
                          " 25 ",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Text(
                          "min",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xff98979A)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(IImageStrings.energyIcon),
                        const Text(
                          " 530 ",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        const Text(
                          "Kcal",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Color(0xff98979A)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const SizedBox(
                      height: 60,
                    ),
                  ],
                )
              ],
            ),
          ),
        if (showControls)
          Positioned(
            bottom: 30,
            right: 16,
            child: SizedBox(
              width: 58,
              height: 58,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD6FFA3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () {},
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.black,
                    size: 28,
                  )),
            ),
          )
      ],
    );
  }
}
