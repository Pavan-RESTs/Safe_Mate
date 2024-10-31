import 'package:client/core/constants/image_strings.dart';
import 'package:client/core/constants/text_strings.dart';
import 'package:client/core/device/device_utility.dart';
import 'package:client/core/theme/pallete.dart';
import 'package:client/feature/main/view/widgets/custom_titlebar.dart';
import 'package:client/feature/main/view/widgets/view_all_button.dart';
import 'package:flutter/material.dart';

import '../widgets/builders/categories_builder.dart';
import '../widgets/builders/date_scroller_unit_builder.dart';
import '../widgets/builders/popular_builder.dart';
import '../widgets/mini_elevated_button.dart';
import '../widgets/shaded_image_with_controls.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            IDeviceUtility.getScreenWidth() * 0.05,
            IDeviceUtility.getAppBarHeight() * 1.2,
            IDeviceUtility.getScreenWidth() * 0.05,
            0),
        child: Column(
          children: [
            const CustomTitleBar(
              title: ITextStrings.myExercisePlan,
              actionWidget: MiniElevatedButton(
                color: IPallete.primaryBlue,
                buttonId: ITextStrings.myProgress,
              ),
            ),
            const DateScrollerUnitBuilder(),
            const SizedBox(
              height: 40,
            ),
            const CustomTitleBar(
              title: ITextStrings.todaySession,
              mediumFont: true,
            ),
            const SizedBox(
              height: 20,
            ),
            ShadedImageWithControls(
              borderRadius: 16,
              image: IImageStrings.exerciseImage1,
              showControls: true,
              width: 380,
              height: IDeviceUtility.getScreenHeight() * 0.214,
            ),
            const CustomTitleBar(
              title: ITextStrings.categories,
              mediumFont: true,
            ),
            const SizedBox(
              height: 15,
            ),
            const CategoriesBuilder(),
            const SizedBox(
              height: 30,
            ),
            const CustomTitleBar(
              title: ITextStrings.popular,
              mediumFont: true,
              actionWidget: ViewAllButton(),
            ),
            const SizedBox(
              height: 10,
            ),
            const PopularBuilder()
          ],
        ),
      ),
    ));
  }
}
