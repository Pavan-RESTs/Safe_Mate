import 'package:flutter/material.dart';

class ITextFieldTheme {
  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.all(20),
    border: const OutlineInputBorder().copyWith(
      borderSide:
          const BorderSide(color: Color.fromRGBO(232, 236, 244, 1), width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderSide:
          const BorderSide(color: Color.fromRGBO(232, 236, 244, 1), width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderSide:
          const BorderSide(color: Color.fromRGBO(232, 236, 244, 1), width: 1),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
