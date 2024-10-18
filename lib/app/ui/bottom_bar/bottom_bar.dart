// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namaz_app/app/ui/fauvorite/favourite.dart';
import 'package:namaz_app/app/ui/home/home_screen.dart';
import 'package:namaz_app/app/ui/near_me/near_me.dart';
import 'package:namaz_app/app/ui/profile/profile_screen.dart';
import 'package:namaz_app/app/ui/shared/bottom_selected.dart';

import 'package:namaz_app/commons/assets.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int selectedTab = 0;

  final List pages = [
    const HomeScreen(),
    const FavouriteScreen(),
    const NearMeScreen(),
    ProfileScreen(),
  ];

  changeTab(int index) {
    selectedTab = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[selectedTab],
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  changeTab(0);
                  setState(() {});
                },
                style: IconButton.styleFrom(
                  foregroundColor: const Color(0xFF77DFFC),
                ),
                icon: selectedTab == 0
                    ? BottomSlect(
                        image: AppAssets.homeSvg,
                        title: 'Home',
                      )
                    : SvgPicture.asset(AppAssets.homeSvg),
              ),
              IconButton(
                onPressed: () {
                  changeTab(1);
                  setState(() {});
                },
                style: IconButton.styleFrom(
                  foregroundColor: const Color(0xFF77DFFC),
                ),
                icon: selectedTab == 1
                    ? BottomSlect(
                        image: AppAssets.likeSvg,
                        title: 'Favourites',
                      )
                    : SvgPicture.asset(AppAssets.likeSvg),
              ),
              IconButton(
                onPressed: () {
                  changeTab(2);
                  setState(() {});
                },
                style: IconButton.styleFrom(
                  foregroundColor: const Color(0xFF77DFFC),
                ),
                icon: selectedTab == 2
                    ? BottomSlect(
                        image: AppAssets.locationSvg,
                        title: 'Near Me',
                      )
                    : SvgPicture.asset(AppAssets.locationSvg),
              ),
              IconButton(
                onPressed: () {
                  changeTab(3);
                  setState(() {});
                },
                style: IconButton.styleFrom(
                  foregroundColor: const Color(0xFF77DFFC),
                ),
                icon: selectedTab == 3
                    ? BottomSlect(
                        image: AppAssets.personSvg,
                        title: 'Profile',
                      )
                    : SvgPicture.asset(AppAssets.personSvg),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
