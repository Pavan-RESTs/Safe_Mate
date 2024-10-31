import 'package:client/core/constants/text_strings.dart';
import 'package:client/feature/main/view/widgets/filterbar.dart';
import 'package:flutter/material.dart';

import '../widgets/builders/home_exercise_list.dart';
import '../widgets/builders/info_dashboard.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_titlebar.dart';
import '../widgets/view_all_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            children: [
              CustomTitleBar(
                title: ITextStrings.dashboard,
                subTitle: ITextStrings.updated1mAgo,
                actionWidget: FilterBar(),
              ),
              SizedBox(
                height: 20,
              ),
              InfoDashboard(),
              SizedBox(
                height: 30,
              ),
              CustomTitleBar(
                title: ITextStrings.activity,
                actionWidget: ViewAllButton(),
              ),
              SizedBox(
                height: 12,
              ),
              HomeExerciseList(
                color: Color(0xffEFF6FF),
              )
            ],
          ),
        ),
      ),
    );
  }
}
