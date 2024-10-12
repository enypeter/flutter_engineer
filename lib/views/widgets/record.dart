import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_engineer/constants/constants.dart';
import 'package:flutter_engineer/constants/dimensions.dart';
import 'package:flutter_engineer/core/app_theme.dart';
import 'package:flutter_engineer/core/app_typography.dart';

class Records extends StatelessWidget {
  const Records({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: BODY_PADDING),
      child: Row(
        children: [
          Flexible(
            child: AspectRatio(
              aspectRatio: 1.1,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primaryColor),
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Text(
                      "BUY",
                      style: TextStyles.style13Regular
                          .copyWith(color: AppColors.whiteColor),
                    ),
                    const Spacer(),
                    Countup(
                      begin: 506,
                      end: 1034,
                      duration: const Duration(seconds: 2),
                      separator: ' ',
                      style: TextStyles.style32Bold
                          .copyWith(color: AppColors.whiteColor),
                    ),
                    tinyVerticalSpace,
                    Text(
                      "offers",
                      style: TextStyles.style15Regular
                          .copyWith(color: AppColors.whiteColor),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          )
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale(duration: 800.ms) // inherits duration from fadeIn
              .move(delay: 400.ms, duration: 600.ms),
          smallHorizontalSpace,
          Flexible(
            child: AspectRatio(
              aspectRatio: 1.1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFFDF8F2)),
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Text(
                      "RENT",
                      style: TextStyles.style13Regular
                          .copyWith(color: AppColors.accentColor),
                    ),
                    const Spacer(),
                    Countup(
                      begin: 1000,
                      end: 2212,
                      duration: const Duration(seconds: 2),
                      separator: ' ',
                      style: TextStyles.style32Bold
                          .copyWith(color: AppColors.accentColor),
                    ),
                    tinyVerticalSpace,
                    Text(
                      "offers",
                      style: TextStyles.style15Regular
                          .copyWith(color: AppColors.accentColor),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          )
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale(duration: 800.ms) // inherits duration from fadeIn
              .move(delay: 400.ms, duration: 600.ms)
        ],
      ),
    );
  }
}
