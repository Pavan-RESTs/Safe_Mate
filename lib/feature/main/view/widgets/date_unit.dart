import 'package:flutter/material.dart';

class DateUnit extends StatelessWidget {
  final bool isActive;
  final String date;
  const DateUnit({
    super.key,
    required this.isActive,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 20, 40, 0),
      child: Column(
        children: [
          Text(
            date,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isActive
                    ? const Color(0xffFF5100)
                    : const Color(0xff000000)),
          ),
          if (isActive)
            const Icon(
              Icons.circle,
              size: 7,
              color: Color(0xffFF5100),
            ),
        ],
      ),
    );
  }
}
