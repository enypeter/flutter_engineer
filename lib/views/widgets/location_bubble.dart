import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_engineer/core/app_theme.dart';
import 'package:flutter_engineer/core/app_typography.dart';

Widget buildBubble(BuildContext context, Random random, bool showMarkerImage) {
  final size = MediaQuery.of(context).size;
  final position = random.nextInt(30);
  return Positioned(
    left: random.nextDouble() * (size.width - position),
    top: random.nextDouble() * (size.height - position),
    child: Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        width: showMarkerImage ? 30.w : 80.w,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8))
                .copyWith(bottomRight: const Radius.circular(8))),
        child: showMarkerImage
            ? Icon(
                Icons.home_work_outlined,
                color: AppColors.whiteColor,
                size: 18,
              )
            : Text(
                '${position + 7.3} mm P',
                textAlign: TextAlign.center,
                style: TextStyles.style11Medium
                    .copyWith(color: AppColors.whiteColor),
              ),
      ),
    ),
  )
      .animate()
      .fadeIn() // uses `Animate.defaultDuration`
      .scale(delay: 300.ms, duration: 400.ms);
}
