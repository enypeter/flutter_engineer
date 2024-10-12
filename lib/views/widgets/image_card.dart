import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_engineer/constants/dimensions.dart';
import 'package:flutter_engineer/core/app_theme.dart';
import 'package:flutter_engineer/core/app_typography.dart';

class ImageBox extends StatelessWidget {
  const ImageBox(this.image, {super.key, this.over = false});

  final String image;
  final bool over;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height(context) * 0.23,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1200),
                curve: Curves.easeInOutCubic,
                width: over ? 180.w : 45.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: AppColors.whiteColor.withOpacity(0.5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (over)
                      Expanded(
                          child: Text('Glaskova St.,25',
                              softWrap: false,
                              overflow: TextOverflow.clip,
                              style: TextStyles.style15Regular
                                  .copyWith(color: AppColors.greyColor),
                              textAlign: TextAlign.center)),
                    Container(
                      padding: const EdgeInsets.all(15),
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
          ),
        ));
  }
}
