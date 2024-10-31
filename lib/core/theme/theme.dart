import 'package:client/core/theme/widget_themes/elevated_button_theme.dart';
import 'package:client/core/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';

class ITheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Poppins',
    inputDecorationTheme: ITextFieldTheme.inputDecorationTheme,
    elevatedButtonTheme: IElevatedButtonTheme.elevatedButtonThemeData,
  );
}
