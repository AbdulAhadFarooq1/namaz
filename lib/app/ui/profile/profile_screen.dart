// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:namaz_app/app/controllers/home_controller.dart';
import 'package:namaz_app/app/ui/shared/profile_button.dart';
import 'package:namaz_app/app/ui/shared/text_widget.dart';
import 'package:namaz_app/commons/assets.dart';
import 'package:namaz_app/commons/colors.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final cont = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.fbgPng), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w)
              .copyWith(top: kToolbarHeight),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomTextWidget(
                text: "Profile",
                textAlign: TextAlign.center,
                maxLines: 1,
                fontSize: 18.sp,
                color: AppColors.titletext,
                fontWeight: FontWeight.w600,
                font: GoogleFonts.poppins(),
              ),
              SizedBox(
                height: 110.h,
                width: 110.w,
                child: Stack(
                  children: [
                    GetBuilder(
                        init: HomeController(),
                        builder: (context) {
                          return Container(
                            height: 110.h,
                            width: 110.w,
                            decoration: BoxDecoration(
                                color: Colors.amber.shade500,
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: Colors.white, width: 4.w)),
                            child: cont.image == null
                                ? null
                                : Image.file(cont.image!),
                          );
                        }),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.h),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 31.h,
                            width: 31.w,
                            decoration: BoxDecoration(
                                color: const Color(0xFFFAFAFA),
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: const Color(0xFFA9A9A9),
                                    width: 1.w)),
                            child: Center(
                              child: SvgPicture.asset(AppAssets.editSvg),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              CustomTextWidget(
                text: "Abdul Ahad",
                textAlign: TextAlign.center,
                maxLines: 1,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                font: GoogleFonts.poppins(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 11.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        CustomTextWidget(
                          text: "47",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          font: GoogleFonts.poppins(),
                        ),
                        CustomTextWidget(
                          text: "Hadith Read",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          font: GoogleFonts.poppins(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomTextWidget(
                          text: "25",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          font: GoogleFonts.poppins(),
                        ),
                        CustomTextWidget(
                          text: "Musjid",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          font: GoogleFonts.poppins(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CustomTextWidget(
                          text: "100",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          font: GoogleFonts.poppins(),
                        ),
                        CustomTextWidget(
                          text: "Tasbiya",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                          font: GoogleFonts.poppins(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Profilebutton(
                title: 'Your Favorite',
                image: AppAssets.blueheartSvg,
                onTap: () {},
              ),
              Profilebutton(
                title: 'Tell your friends',
                image: AppAssets.promotionSvg,
                onTap: () {},
              ),
              Profilebutton(
                title: 'Settings',
                image: AppAssets.settingSvg,
                onTap: () {},
              ),
              Profilebutton(
                title: 'Notification',
                image: AppAssets.bluebellSvg,
                onTap: () {},
              ),
              Profilebutton(
                title: 'log out',
                image: AppAssets.logoutSvg,
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

