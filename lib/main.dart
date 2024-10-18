import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaz_app/app/ui/custom_splash/splash.dart';
import 'package:namaz_app/app_binding.dart';
import 'package:namaz_app/commons/colors.dart';

import 'app/data/translation/translation_service.dart';
import 'utils/logger.dart';

late final GetStorage getBox;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  getBox = GetStorage();
  try {
    runApp(
      DevicePreview(
        enabled: kDebugMode,
        builder: (context) => const MyApp(),
      ),
    );
  } on Exception catch (e) {
    Logger.error(e);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: AppColors.transparentWhite,
        ),
      );
    }
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: GetMaterialApp(
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: TextScaler.noScaling,
              // viewInsets:
              //     Platform.isIOS ? const EdgeInsets.only(bottom: 20) : null,
            ),
            child: child!,
          );
        },
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,
            fontFamily: GoogleFonts.lato().fontFamily,
            appBarTheme: AppBarTheme(
              toolbarHeight: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: AppColors.transparentWhite,
                  statusBarIconBrightness: Brightness.dark),
            )),
        translations: TranslationService.instance,
        debugShowCheckedModeBanner: false,
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        initialBinding: AppBinding(),
        home: const SplashScreen(),
      ),
    );
  }
}
