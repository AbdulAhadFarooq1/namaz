// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:namaz_app/app/ui/shared/text_widget.dart';

class BottomSlect extends StatelessWidget {
  String image;
  String title;
  BottomSlect({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xFFE0F1F5),
          borderRadius: BorderRadius.circular(6.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        child: Row(
          children: [
            SvgPicture.asset(
              image,
              
              color: const Color(0xFF42A8C3),
            ),
            SizedBox(width: 5.w),
            CustomTextWidget(
              text: title,
              color: const Color(0xFF42A8C3),
              maxLines: 1,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }
}