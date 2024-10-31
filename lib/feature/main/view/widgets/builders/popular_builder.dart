import 'package:flutter/cupertino.dart';

import '../../../../../core/constants/image_strings.dart';
import '../shaded_image_with_controls.dart';

class PopularBuilder extends StatelessWidget {
  const PopularBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ShadedImageWithControls(
            borderRadius: 10,
            image: IImageStrings.exerciseImage2,
            width: 180,
            height: 96,
          ),
          SizedBox(
            width: 10,
          ),
          ShadedImageWithControls(
            borderRadius: 10,
            image: IImageStrings.exerciseImage3,
            width: 180,
            height: 96,
          ),
        ],
      ),
    );
  }
}
