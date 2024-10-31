import 'package:flutter/material.dart';

class MiniElevatedButton extends StatelessWidget {
  final String buttonId;
  final Color color;
  const MiniElevatedButton({
    super.key,
    required this.buttonId,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: () {},
        child: Text(
          buttonId,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 12, fontFamily: 'Inter'),
        ));
  }
}
