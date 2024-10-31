import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/text_strings.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 38,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xffa4a4a4),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Iconsax.filter_search4,
            color: Color(0xffa4a4a4),
          ),
          Text(
            ITextStrings.filter,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xffa4a4a4),
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
