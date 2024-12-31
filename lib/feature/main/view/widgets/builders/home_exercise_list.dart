import 'package:client/core/constants/animation_strings.dart';
import 'package:client/feature/main/view/widgets/custom_exercise_demo.dart';
import 'package:flutter/material.dart';

import '../exercise_card.dart';

class HomeExerciseList extends StatelessWidget {
  final Color color;
  const HomeExerciseList({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return const CustomExerciseDemoCard(
              exerciseName: '1',
              exerciseDescription: 'des1',
              lottieAsset: IAnimationStrings.exercise1,
              reps: 12,
              sets: 3);
        },
      );
    }

    return Column(
      children: [
        ExerciseCard(
          onPressed: () {
            _showMyDialog();
          },
          date: '18',
          month: 'Sep',
          title: 'Otago Exercise',
          sets: '2',
          startAndEnd: '08:20 AM - 10:30 AM',
          bgColor: color,
        ),
        ExerciseCard(
          date: '19',
          month: 'Sep',
          title: 'Tai jin Exercise',
          sets: '2',
          startAndEnd: '09:20 PM - 11:30 PM',
          bgColor: color,
        ),
        ExerciseCard(
          date: '20',
          month: 'Sep',
          title: 'Warm ups',
          sets: '2',
          startAndEnd: '06:20 AM - 08:30 AM',
          bgColor: color,
        ),
      ],
    );
  }
}
