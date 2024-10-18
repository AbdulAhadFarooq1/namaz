
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:namaz_app/app/ui/shared/text_widget.dart';
import 'package:namaz_app/commons/colors.dart';

class SmallContainer extends StatelessWidget {
  String name;
  String image;
  dynamic svg;
  SmallContainer({
    super.key,
    required this.name,
    required this.image,
    this.svg,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.lightwhite,
          ),
          child: Padding(
            padding: EdgeInsets.all(5.h),
            child:
                image.isNotEmpty ? Image.asset(image) : SvgPicture.asset(svg),
          ),
        ),
        SizedBox(height: 6.h),
        CustomTextWidget(
          text: name,
          color: AppColors.transparentBlack,
          maxLines: 1,
          fontSize: 12.sp,
        ),
      ],
    );
  }
}
