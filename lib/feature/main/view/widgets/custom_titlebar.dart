import 'package:flutter/cupertino.dart';

class CustomTitleBar extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Widget? actionWidget;
  final bool mediumFont;
  const CustomTitleBar({
    super.key,
    required this.title,
    this.subTitle,
    this.actionWidget,
    this.mediumFont = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: mediumFont ? 18 : 24, fontWeight: FontWeight.w600),
            ),
            if (subTitle != null)
              Text(
                subTitle!,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffC4C4C4)),
              ),
          ],
        ),
        if (actionWidget != null) actionWidget!,
      ],
    );
  }
}
