// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:namaz_app/app/ui/shared/text_widget.dart';

class Profilebutton extends StatelessWidget {
  String title;
  String image;
  VoidCallback onTap;
  Profilebutton({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(foregroundColor: Colors.white),
        onPressed: onTap,
        child: Row(
          children: [
            SvgPicture.asset(image),
            SizedBox(width: 21.w),
            CustomTextWidget(
              text: title,
              maxLines: 1,
              color: const Color(0xFF454545),
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ));
  }
}
