import 'package:client/core/theme/pallete.dart';
import 'package:flutter/material.dart';

class IElevatedButtonTheme {
  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: IPallete.primaryBlue,
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
  );
}
