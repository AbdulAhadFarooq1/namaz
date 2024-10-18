import 'dart:io';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:namaz_app/utils/logger.dart';

class HomeController extends GetxController {
  File? image;

  Future pickImage() async {
    try {
      print("oooooooooooooooooooooooooooo");
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      update();
      this.image = imageTemp;
    } on PlatformException catch (e) {
      Logger.error('Failed to pick image: $e');
    }
  }
}
