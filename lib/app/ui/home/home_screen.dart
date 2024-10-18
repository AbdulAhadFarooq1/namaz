// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namaz_app/app/ui/shared/bgContainer.dart';
import 'package:namaz_app/app/ui/shared/home_container_button.dart';
import 'package:namaz_app/app/ui/shared/mosque_grid.dart';
import 'package:namaz_app/app/ui/shared/text_widget.dart';
import 'package:namaz_app/commons/assets.dart';
import 'package:namaz_app/commons/colors.dart';
import 'package:namaz_app/utils/custom_extentions.dart';
import 'package:namaz_app/utils/responsive_helper.dart';
import 'package:namaz_app/utils/text_field_decoration.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = ResponsiveHelper.getDeviceHeight(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            
              child: Stack(
            children: [
              Column(
                children: [
                  deviceHeight < 1500
                      ? ScreenBgImage(
                          flex: 7,
                          image: "",
                        )
                      : ScreenBgImage(
                          flex: 4,
                          image: "",
                        ),
                  deviceHeight < 1500
                      ? const Expanded(
                          flex: 3,
                          child: SizedBox(),
                        )
                      : const Expanded(
                          flex: 3,
                          child: SizedBox(),
                        ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w)
                    .copyWith(top: kToolbarHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.transparentWhite,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: TextFormField(
                            onTapOutside: (event) => context.hideKeyboard(),
                            decoration: inputDecoration(
                              hintText: "Find",
                            ).copyWith(
                                fillColor: AppColors.transparentWhite,
                                suffixIcon: IconButton(
                                    onPressed: () {},
                                    style: IconButton.styleFrom(
                                      shape: const RoundedRectangleBorder(),
                                      padding: const EdgeInsets.all(4)
                                    ),
                                    icon:
                                        SvgPicture.asset(AppAssets.searchSvg)),
                                prefixIcon: Padding(
                                  
                                  padding: const EdgeInsets.all(10),
                                  child: SvgPicture.asset(
                                    AppAssets.bluesearchSvg,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.transparentWhite,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                        color: AppColors.transparentWhite)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: BorderSide(
                                      color: AppColors.transparentWhite,
                                    ))),
                          ),
                        )),
                        SizedBox(width: 20.w),
                        Container(
                          height: 52.h,
                          width: 52.w,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15.r),
                            color: AppColors.transparentWhite,
                          ),
                          child: Center(
                            child: SvgPicture.asset(AppAssets.bellSvg),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                    CustomTextWidget(
                      text: "Your Location",
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      maxLines: 1,
                    ),
                    CustomTextWidget(
                      text: "Green Campus, Central university, Ganderbal",
                      color: AppColors.blue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w900,
                      maxLines: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFDCAFFF).withOpacity(0.3),
                          border: Border.all(color: AppColors.darkred),
                          image: const DecorationImage(
                              image: AssetImage(AppAssets.bgCMPng),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 15.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: "Duhar",
                                color: Colors.white,
                                fontSize: 15.sp,
                                maxLines: 1,
                                fontWeight: FontWeight.w700,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomTextWidget(
                                    text: "01:15",
                                    color: Colors.white,
                                    fontSize: 40.sp,
                                    fontWeight: FontWeight.w900,
                                  ),
                                  SizedBox(width: 10.w),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8.h),
                                    child: CustomTextWidget(
                                      text: "AM",
                                      color: Colors.white,
                                      maxLines: 1,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h),
                              CustomTextWidget(
                                text: "Next Pray: Asr",
                                color: Colors.white,
                                maxLines: 1,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              CustomTextWidget(
                                text: "05:32 PM",
                                color: Colors.white,
                                maxLines: 1,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w800,
                              ),
                              SizedBox(height: 10.h),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const HomeButtonContainer(),
                    deviceHeight < 1500
                        ? const SizedBox.shrink()
                        : Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w)
                                .copyWith(top: 15.h),
                            child: CustomTextWidget(
                              text: "Mosques",
                              color: AppColors.darktext,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              maxLines: 1,
                            ),
                          ),
                    deviceHeight < 1500
                        ? const SizedBox.shrink()
                        : Expanded(
                            child: GridView.builder(
                                padding: EdgeInsets.only(top: 15.h),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 170.h,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 15.w,
                                  mainAxisSpacing: 10.h,
                                ),
                                itemCount: 2,
                                itemBuilder: (context, index) {
                                  return const MosqueContainer();
                                })),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
