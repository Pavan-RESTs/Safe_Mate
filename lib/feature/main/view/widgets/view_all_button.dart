import 'package:flutter/cupertino.dart';

import '../../../../core/constants/text_strings.dart';

class ViewAllButton extends StatelessWidget {
  const ViewAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      ITextStrings.viewAll,
      style: TextStyle(
          fontWeight: FontWeight.w600, fontSize: 16, color: Color(0xffc4c4c4)),
    );
  }
}
