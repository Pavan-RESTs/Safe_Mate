import 'package:client/feature/main/view/widgets/builders/home_exercise_list.dart';
import 'package:client/feature/main/view/widgets/view_all_button.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/text_strings.dart';
import '../../../../core/device/device_utility.dart';
import '../widgets/custom_titlebar.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

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
        child: const Column(
          children: [
            CustomTitleBar(
              title: ITextStrings.activities,
              actionWidget: Icon(Icons.menu),
            ),
            SizedBox(
              height: 20,
            ),
            CustomTitleBar(
              title: ITextStrings.recentActivity,
              mediumFont: true,
            ),
            SizedBox(
              height: 10,
            ),
            HomeExerciseList(color: Color(0xffEFF6FF)),
            SizedBox(
              height: 5,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            CustomTitleBar(
              title: ITextStrings.pastActivity,
              mediumFont: true,
              actionWidget: ViewAllButton(),
            ),
            SizedBox(
              height: 10,
            ),
            HomeExerciseList(
              color: Color(0xffFFF5EF),
            )
          ],
        ),
      ),
    ));
  }
}
