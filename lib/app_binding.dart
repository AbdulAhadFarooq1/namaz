import 'package:get/get.dart';

import 'package:namaz_app/app/controllers/home_controller.dart';
import 'package:namaz_app/utils/logger.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Logger.info("Binding called");
  
       Get.lazyPut(() => HomeController(),fenix: true);
       
  }
}
