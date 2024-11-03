import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../core/theme/pallete.dart';

class FlaskAPI {
  static const String baseUrl = 'http://192.168.15.53:5000';

  static Future<void> toggleDataFeeding(bool state) async {
    final url = Uri.parse('$baseUrl/toggle_start/$state');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Get.snackbar(
          duration: const Duration(milliseconds: 1500),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          snackPosition: SnackPosition.BOTTOM,
          'Success',
          'Data collection ${state ? 'started' : 'stopped'}',
          backgroundColor: IPallete.primaryBlue.withOpacity(0.7),
          colorText: Colors.white,
        );
      } else {
        throw Exception(
            'Failed to toggle data feeding: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        duration: const Duration(milliseconds: 1500),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        snackPosition: SnackPosition.BOTTOM,
        'Error',
        'Failed to toggle data collection',
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
    }
  }

  static Future<void> setPositionLabel(String label) async {
    final url = Uri.parse('$baseUrl/set_label/$label');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Get.snackbar(
          duration: const Duration(milliseconds: 1500),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          snackPosition: SnackPosition.BOTTOM,
          'Success',
          'Position label set to: $label',
          backgroundColor: IPallete.primaryBlue.withOpacity(0.7),
          colorText: Colors.white,
        );
      } else {
        throw Exception('Failed to set label: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        duration: const Duration(milliseconds: 1500),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        snackPosition: SnackPosition.BOTTOM,
        'Error',
        'Failed to set label',
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
    }
  }

  static Future<void> fetchData() async {
    final url = Uri.parse('$baseUrl/data');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Get.snackbar(
          duration: const Duration(milliseconds: 1500),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          snackPosition: SnackPosition.BOTTOM,
          'Success',
          'Data saved successfully',
          backgroundColor: IPallete.primaryBlue.withOpacity(0.7),
          colorText: Colors.white,
        );
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        duration: const Duration(milliseconds: 1500),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        snackPosition: SnackPosition.BOTTOM,
        'Error',
        'Failed to save data',
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
    }
  }

  static Future<void> startCalibration() async {
    final url = Uri.parse('$baseUrl/calibrate');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        Get.snackbar(
          duration: const Duration(milliseconds: 1500),
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          snackPosition: SnackPosition.BOTTOM,
          'Calibration Started',
          'Keep the sensor still',
          backgroundColor: IPallete.primaryBlue.withOpacity(0.7),
          colorText: Colors.white,
        );
      } else {
        throw Exception('Failed to start calibration: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        duration: const Duration(milliseconds: 1500),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        snackPosition: SnackPosition.BOTTOM,
        'Error',
        'Failed to start calibration',
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
    }
  }

  static Future<Map<String, dynamic>> getCalibrationStatus() async {
    final url = Uri.parse('$baseUrl/calibration_status');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return Map<String, dynamic>.from(json.decode(response.body));
      } else {
        throw Exception(
            'Failed to get calibration status: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        duration: const Duration(milliseconds: 1500),
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        snackPosition: SnackPosition.BOTTOM,
        'Error',
        'Failed to get calibration status',
        backgroundColor: Colors.red.withOpacity(0.7),
        colorText: Colors.white,
      );
      rethrow;
    }
  }
}
