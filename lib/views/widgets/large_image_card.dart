import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_engineer/constants/asset_paths.dart';
import 'package:flutter_engineer/constants/dimensions.dart';
import 'package:flutter_engineer/core/app_theme.dart';
import 'package:flutter_engineer/core/app_typography.dart';

class LardImageCard extends StatelessWidget {
  const LardImageCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context) * 0.23,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          image: const DecorationImage(
              image: AssetImage(AppImages.kitchen), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(25)),
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(bottom: 10),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.decelerate,
              width:  double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: AppColors.whiteColor.withOpacity(0.5)),
              child: Row(
                children: [


                  Expanded(
                      child: Text('Glaskova St.,25',
                          style: TextStyles.style15Regular,
                          textAlign: TextAlign.center)),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.whiteColor),
                    child: Icon(
                      Icons.chevron_right_outlined,
                      color: AppColors.accentColor,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
          ),
        ).animate()// uses `Animate.defaultDuration`
            .scale(delay:500.ms,duration: 800.ms) // inherits duration from fadeIn
            .move(delay: 300.ms, duration: 600.ms),
      ),
    );
  }
}
