import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:namaz_app/app/ui/shared/mosque_grid.dart';
import 'package:namaz_app/commons/assets.dart';
import 'package:namaz_app/commons/colors.dart';
import 'package:namaz_app/utils/custom_extentions.dart';
import 'package:namaz_app/utils/text_field_decoration.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.fbgPng), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w)
              .copyWith(top: kToolbarHeight),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.transparentWhite,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: TextFormField(
                  onTapOutside: (event) => context.hideKeyboard(),
                  decoration: inputDecoration(
                    hintText: "Find Mosque",
                  ).copyWith(
                      fillColor: AppColors.transparentWhite,
                      suffixIcon: SvgPicture.asset(AppAssets.searchSvg),
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
                          borderSide:
                              BorderSide(color: AppColors.transparentWhite)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.r),
                          borderSide: BorderSide(
                            color: AppColors.transparentWhite,
                          ))),
                ),
              ),
              SizedBox(height: 5.h),
              Expanded(
                  child: GridView.builder(
                      padding: EdgeInsets.only(top: 36.h),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 170.h,
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 10.h,
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return const MosqueContainer();
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
