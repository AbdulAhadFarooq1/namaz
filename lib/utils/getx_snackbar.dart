import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../commons/colors.dart';

class Snack {
  static void showSuccessSnackBar(dynamic message) {
    Get.snackbar(
      'success'.tr,
      message.toString(),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      backgroundColor: AppColors.greenClr,
      colorText: Colors.white,
      borderRadius: 12,
      duration: const Duration(seconds: 3),
    );
  }

  static void showInfoSnackBar(dynamic message) {
    Get.snackbar(
      'info'.tr,
      message.toString(),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      backgroundColor: AppColors.primary,
      colorText: Colors.white,
      borderRadius: 12,
      duration: const Duration(seconds: 3),
    );
  }

  static void showErrorSnackBar(dynamic message,
      {TextButton? textButton, int sec = 3}) {
    Get.snackbar(
      'error'.tr,
      message.toString(),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      backgroundColor: AppColors.redClr,
      colorText: Colors.white,
      borderRadius: 12,
      mainButton: textButton,
      duration: Duration(seconds: sec),
    );
  }
}
