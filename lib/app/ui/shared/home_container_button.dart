import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:namaz_app/app/ui/shared/home_button.dart';
import 'package:namaz_app/commons/assets.dart';
import 'package:namaz_app/commons/colors.dart';

class HomeButtonContainer extends StatelessWidget {
  const HomeButtonContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        color: AppColors.transparentWhite,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20.h, horizontal: 40.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallContainer(
                  name: "Hadith",
                  image: AppAssets.manPng,
                ),
                SmallContainer(
                  name: "Dua",
                  image: AppAssets.duaPng,
                ),
                SmallContainer(
                  name: "Daily Verse",
                  image: AppAssets.quarnPng,
                )
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallContainer(
                  name: "Community",
                  image: AppAssets.comunityPng,
                ),
                SmallContainer(
                  name: "Maps",
                  image: AppAssets.mapPng,
                ),
                SmallContainer(
                  name: "More",
                  image: "",
                  svg: AppAssets.categorySvg,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

