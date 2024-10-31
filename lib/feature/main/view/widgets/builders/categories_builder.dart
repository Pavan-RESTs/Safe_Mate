import 'package:flutter/cupertino.dart';

import '../../../../../core/constants/image_strings.dart';
import '../../../../../core/constants/text_strings.dart';
import '../categorical_card.dart';

class CategoriesBuilder extends StatelessWidget {
  const CategoriesBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoriesCard(
            title: ITextStrings.breathing,
            image: IImageStrings.categories1,
            bgColor: Color(0xffFEF1E0),
          ),
          CategoriesCard(
            title: ITextStrings.yoga,
            image: IImageStrings.categories2,
            bgColor: Color(0xffE1F4FB),
          ),
          CategoriesCard(
            title: ITextStrings.stretching,
            image: IImageStrings.categories3,
            bgColor: Color(0xffECFBDC),
          ),
        ],
      ),
    );
  }
}
