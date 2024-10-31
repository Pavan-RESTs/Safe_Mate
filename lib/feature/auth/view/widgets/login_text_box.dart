import 'package:client/core/constants/image_strings.dart';
import 'package:flutter/material.dart';

class LoginTextBox extends StatelessWidget {
  final String hintText;
  final bool showSuffixIcon;
  final TextEditingController textEditingController;
  const LoginTextBox(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      required this.showSuffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      cursorColor: Colors.black54,
      cursorHeight: 20,
      cursorOpacityAnimates: true,
      controller: textEditingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(247, 248, 249, 1),
        hintText: hintText,
      ).copyWith(
          suffixIcon: showSuffixIcon
              ? GestureDetector(
                  child: Image.asset(IImageStrings.eyeBall),
                )
              : null,
          hintStyle: const TextStyle(
              fontSize: 12.3,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(131, 145, 161, 1))),
    );
  }
}
