import 'package:flutter/material.dart';

class ResponsiveHelper {
  static double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width *
        MediaQuery.of(context).devicePixelRatio;
  }

  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height *
            MediaQuery.of(context).devicePixelRatio +
        kToolbarHeight +
        kBottomNavigationBarHeight;
  }
}
