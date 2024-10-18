// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:namaz_app/commons/assets.dart';

class ScreenBgImage extends StatelessWidget {
  int flex;
  String image;
  ScreenBgImage({
    super.key,
    required this.flex,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage(
                    image.isNotEmpty ? image : AppAssets.bgPng,
                  ),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.r),
                bottomRight: Radius.circular(40.r),
              )),
        ));
  }
}
