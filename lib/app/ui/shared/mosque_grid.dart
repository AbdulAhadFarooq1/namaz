import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:namaz_app/app/ui/shared/text_widget.dart';
import 'package:namaz_app/commons/assets.dart';
import 'package:namaz_app/commons/colors.dart';

class MosqueContainer extends StatelessWidget {
  const MosqueContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.transparentWhite,
          border: Border.all(
              color: Colors.white, width: 2.w),
          borderRadius: BorderRadius.circular(25.r)),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage(
                                AppAssets.mosq7Png),
                            fit: BoxFit.cover),
                        color: Colors.blue,
                        borderRadius:
                            BorderRadius.all(
                                Radius.circular(
                                    25.r)),
                        shape: BoxShape.rectangle),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: 27.h,
                      width: 27.w,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white),
                      child: Padding(
                        padding:
                            const EdgeInsets.all(2.0),
                        child: Container(
                          decoration:
                              const BoxDecoration(
                                  shape:
                                      BoxShape.circle,
                                  color: AppColors
                                      .lightorange),
                          child: Center(
                            child: SvgPicture.asset(
                                AppAssets
                                    .bookmarkSvg),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 7.w, vertical: 5.h),
              child: CustomTextWidget(
                text: "Masjid Umar Mosque",
                maxLines: 1,
                color: AppColors.darktext,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 9.w, right: 20.w),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    AppAssets.locationSvg,
                    // ignore: deprecated_member_use
                    color: const Color(0xFF42A8C3),
                    height: 15.h,
                    width: 15.w,
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: CustomTextWidget(
                      text:
                          "6Q68+7FM,Tullamulla,Saloora,Jammu and Kashmir, 191201",
                      color:const Color(0xFF8F8F8F),
                      fontSize: 8.sp,
                      maxLines: 2,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
