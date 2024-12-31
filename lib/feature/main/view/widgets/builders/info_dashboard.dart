import 'package:client/core/device/device_utility.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/image_strings.dart';
import '../info_card.dart';

class InfoDashboard extends StatefulWidget {
  const InfoDashboard({
    super.key,
  });

  @override
  State<InfoDashboard> createState() => _InfoDashboardState();
}

class _InfoDashboardState extends State<InfoDashboard> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String documentId = 'current_sensor_data';

  Stream<DocumentSnapshot> getSensorDataStream() {
    return _firestore
        .collection('sensor_predictions')
        .doc(documentId)
        .snapshots();
  }

  String formatFallStatus(String prediction) {
    return prediction.toLowerCase() == 'falling' ? 'Detected' : 'Normal';
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: getSensorDataStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Something went wrong'));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final data = snapshot.data?.data() as Map<String, dynamic>?;

        if (data == null) {
          return const Center(child: Text('No data available'));
        }

        final ecgValue = data['ecg_value']?.toString() ?? '--';
        final temperature = data['temperature']?.toString() ?? '--';
        final position = data['prediction'] ?? 'Unknown';
        final isFalling = position.toLowerCase() == 'falling';

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCard(
                  title: 'Heart Rate',
                  info: ecgValue,
                  metric: 'bpm',
                  imagePath: IImageStrings.heartRateIcon,
                  isAlert: false,
                ),
                InfoCard(
                  title: 'Temperature',
                  info: temperature,
                  metric: '°C',
                  imagePath: IImageStrings.temperatureIcon,
                  isAlert: false,
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InfoCard(
                  title: 'Position',
                  info: position,
                  metric: '',
                  imagePath: IImageStrings.positionIcon,
                  isAlert: false,
                ),
                InfoCard(
                  title: 'Fall',
                  info: formatFallStatus(position),
                  metric: '',
                  imagePath: IImageStrings.fallIcon,
                  isAlert: isFalling,
                ),
              ],
            ),
            if (isFalling)
              Container(
                width: IDeviceUtility.getScreenWidth() * 0.9,
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.red),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      color: Colors.red,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Fall Detected! Check person immediately',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
