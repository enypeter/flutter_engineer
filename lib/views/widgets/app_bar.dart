import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_engineer/constants/asset_paths.dart';
import 'package:flutter_engineer/constants/constants.dart';
import 'package:flutter_engineer/constants/dimensions.dart';
import 'package:flutter_engineer/core/app_theme.dart';
import 'package:flutter_engineer/core/app_typography.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: bodyPadding).copyWith(top: 10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: [
                  Icon(Icons.location_on_rounded,
                      color: AppColors.lightAccentColor, size: 18),
                  tinyHorizontalSpace,
                  Text(
                    'Saint Petersburg',
                    style: TextStyles.style13Medium
                        .copyWith(color: AppColors.lightAccentColor),
                  )
                ],
              ),
            ),
          ).animate().scale(delay: 300.ms, duration: 600.ms),
          const Spacer(),
          Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppImages.user),
                      )))
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(delay: 200.ms, duration: 600.ms)
        ],
      ),
    );
  }
}
