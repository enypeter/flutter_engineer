import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_engineer/constants/asset_paths.dart';
import 'package:flutter_engineer/core/app_theme.dart';
import 'package:flutter_engineer/helpers/image_holder.dart';
import 'package:flutter_engineer/helpers/ripple_painter.dart';
import 'package:flutter_engineer/views/home_page.dart';
import 'package:flutter_engineer/views/map_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;
  final pages = [
    const MapScreen(),
    Container(color: Colors.black),
    const HomeScreen(),
    Container(color: Colors.black),

    Container(color: Colors.black),

  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        pages[currentIndex],
        Positioned(
          bottom: 0,
          right: 45,
          left: 45,
          child: SafeArea(
            top: false,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.darkColor,
                ),
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildBottomNavigationBarItem(0, AppImages.search),
                    buildBottomNavigationBarItem(1, AppImages.message),
                    buildBottomNavigationBarItem(2, AppImages.home),
                    buildBottomNavigationBarItem(3, AppImages.favourite),
                    buildBottomNavigationBarItem(4, AppImages.profile),
                  ],
                ),
              ),
            ),
          ),
        ).animate().slideY(
            begin: 2,
            end: 0,
            curve: Curves.decelerate,
            delay: 1150.ms,
            duration: 1550.ms)
      ]),
    );
  }

  Widget buildBottomNavigationBarItem(index, image) {
    return CustomRippleAnimation(
        child: Container(
          decoration: BoxDecoration(
              color: currentIndex == index
                  ? AppColors.primaryColor
                  : Colors.transparent,
              shape: BoxShape.circle),
          padding: const EdgeInsets.all(15),
          child: ImageHolder(
            imagePath: image,
            color: AppColors.whiteColor,
            height: 20,
            width: 20,
          ),
        ),
        onTap: () => setState(() => currentIndex = index));
  }
}
