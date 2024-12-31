import 'dart:async';

import 'package:client/api/collect_data.dart';
import 'package:client/core/theme/pallete.dart';
import 'package:client/feature/auth/view/widgets/login_text_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectData extends StatefulWidget {
  const CollectData({super.key});

  @override
  _CollectDataState createState() => _CollectDataState();
}

class _CollectDataState extends State<CollectData> {
  String currentLabel = "Sitting";
  bool isRunning = false;
  bool isCalibrating = false;
  Timer? calibrationTimer;
  int calibrationProgress = 0;

  @override
  void dispose() {
    calibrationTimer?.cancel();
    super.dispose();
  }

  void updateLabel(String newLabel) async {
    if (!isRunning) {
      setState(() {
        currentLabel = newLabel;
      });
      await FlaskAPI.setPositionLabel(currentLabel);
    } else {
      Get.snackbar(
        duration: const Duration(milliseconds: 1500),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        snackPosition: SnackPosition.BOTTOM,
        'Warning',
        'Stop data collection before changing label',
        backgroundColor: Colors.orange.withOpacity(0.7),
        colorText: Colors.white,
      );
    }
  }

  void toggleStartStop() async {
    if (isCalibrating) {
      Get.snackbar(
        duration: const Duration(milliseconds: 1500),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        snackPosition: SnackPosition.BOTTOM,
        'Warning',
        'Please wait for calibration to complete',
        backgroundColor: Colors.orange.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }
    setState(() {
      isRunning = !isRunning;
    });
    await FlaskAPI.toggleDataFeeding(isRunning);
  }

  void saveData() async {
    if (isRunning) {
      Get.snackbar(
        duration: const Duration(milliseconds: 1500),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        snackPosition: SnackPosition.BOTTOM,
        'Warning',
        'Stop data collection before saving',
        backgroundColor: Colors.orange.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }
    await FlaskAPI.fetchData();
  }

  void startCalibration() async {
    if (isRunning) {
      Get.snackbar(
        duration: const Duration(milliseconds: 1500),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        snackPosition: SnackPosition.BOTTOM,
        'Warning',
        'Stop data collection before calibrating',
        backgroundColor: Colors.orange.withOpacity(0.7),
        colorText: Colors.white,
      );
      return;
    }

    setState(() {
      isCalibrating = true;
      calibrationProgress = 0;
    });

    await FlaskAPI.startCalibration();

    // Start polling calibration status
    calibrationTimer =
        Timer.periodic(const Duration(milliseconds: 500), (timer) async {
      try {
        final status = await FlaskAPI.getCalibrationStatus();
        final bool stillCalibrating = status['is_calibrating'];
        final int samplesCollected = status['samples_collected'];
        final int samplesRequired = status['samples_required'];

        setState(() {
          calibrationProgress =
              ((samplesCollected / samplesRequired) * 100).round();
        });

        if (!stillCalibrating) {
          timer.cancel();
          setState(() {
            isCalibrating = false;
          });
          Get.snackbar(
            duration: const Duration(milliseconds: 1500),
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            snackPosition: SnackPosition.BOTTOM,
            'Success',
            'Calibration completed successfully',
            backgroundColor: IPallete.primaryBlue.withOpacity(0.7),
            colorText: Colors.white,
          );
        }
      } catch (e) {
        timer.cancel();
        setState(() {
          isCalibrating = false;
        });
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('Enter IP address'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                LoginTextBox(
                    hintText: "Eg : 192.168.15.53",
                    textEditingController: controller,
                    showSuffixIcon: false),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                FlaskAPI.ipAddress = controller.text.trim();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: _showMyDialog,
              icon: const Icon(
                Icons.cable_rounded,
                color: Colors.white,
              ))
        ],
        backgroundColor: IPallete.primaryBlue,
        title: const Text(
          "Collect data",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          if (isCalibrating) ...[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 110.0, horizontal: 38),
              child: Column(
                children: [
                  Text(
                    'Calibrating: $calibrationProgress%',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: calibrationProgress / 100,
                    backgroundColor: Colors.grey[300],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        IPallete.primaryBlue),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Keep the sensor still',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 180),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DataAttributeButton(
                      title: 'Sitting',
                      color: IPallete.primaryBlue,
                      currentLabel: currentLabel,
                      onPressed: () => updateLabel('Sitting'),
                    ),
                    DataAttributeButton(
                      title: 'Standing',
                      color: IPallete.primaryBlue,
                      currentLabel: currentLabel,
                      onPressed: () => updateLabel('Standing'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DataAttributeButton(
                      title: 'Walking',
                      color: IPallete.primaryBlue,
                      currentLabel: currentLabel,
                      onPressed: () => updateLabel('Walking'),
                    ),
                    DataAttributeButton(
                      title: 'Running',
                      color: IPallete.primaryBlue,
                      currentLabel: currentLabel,
                      onPressed: () => updateLabel('Running'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DataAttributeButton(
                      title: 'Jumping',
                      color: IPallete.primaryBlue,
                      currentLabel: currentLabel,
                      onPressed: () => updateLabel('Jumping'),
                    ),
                    DataAttributeButton(
                      title: 'Falling',
                      color: IPallete.primaryBlue,
                      currentLabel: currentLabel,
                      onPressed: () => updateLabel('Falling'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ActionButton(
                      title: isRunning ? 'Stop' : 'Start',
                      color: isRunning ? Colors.red : IPallete.primaryGreen,
                      onPressed: toggleStartStop,
                      isDisabled: isCalibrating,
                    ),
                    ActionButton(
                      title: 'Save',
                      color: Colors.amber,
                      onPressed: saveData,
                      isDisabled: isRunning || isCalibrating,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ActionButton(
                  title: 'Calibrate Sensor',
                  color: IPallete.primaryBlue,
                  onPressed: startCalibration,
                  isDisabled: isRunning || isCalibrating,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;
  final bool isDisabled;

  const ActionButton({
    super.key,
    required this.title,
    required this.color,
    required this.onPressed,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled ? Colors.grey : color,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: isDisabled ? Colors.grey[400] : Colors.white,
          ),
        ),
      ),
    );
  }
}

class DataAttributeButton extends StatelessWidget {
  final String title;
  final Color color;
  final String currentLabel;
  final VoidCallback onPressed;

  const DataAttributeButton({
    super.key,
    required this.title,
    required this.color,
    required this.currentLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: title == currentLabel ? IPallete.orange : color,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
