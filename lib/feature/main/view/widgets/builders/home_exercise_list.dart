import 'package:flutter/cupertino.dart';

import '../exercise_card.dart';

class HomeExerciseList extends StatelessWidget {
  final Color color;
  const HomeExerciseList({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExerciseCard(
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
