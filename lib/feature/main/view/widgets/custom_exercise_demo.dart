import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomExerciseDemoCard extends StatelessWidget {
  final String exerciseName;
  final String exerciseDescription;
  final String lottieAsset;
  final int reps;
  final int sets;

  const CustomExerciseDemoCard({
    Key? key,
    required this.exerciseName,
    required this.exerciseDescription,
    required this.lottieAsset,
    required this.reps,
    required this.sets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lottie animation
            Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Lottie.asset(
                  lottieAsset,
                  repeat: true,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Exercise title
            Text(
              exerciseName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Exercise description
            Text(
              exerciseDescription,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 16),

            // Reps and sets info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reps: $reps',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Sets: $sets',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
