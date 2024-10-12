import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_engineer/constants/dimensions.dart';
import 'package:flutter_engineer/core/app_theme.dart';
import 'package:flutter_engineer/core/app_typography.dart';

class ImageBox extends StatefulWidget {
  const ImageBox(this.image, {super.key});

  final String image;

  @override
  State<ImageBox> createState() => _ImageBoxState();
}

class _ImageBoxState extends State<ImageBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int animationDuration = 1900;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: animationDuration - 200));

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _controller.forward();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height(context) * 0.23,
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            image: DecorationImage(
                image: AssetImage(widget.image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) => AnimatedContainer(
                  duration: Duration(milliseconds: animationDuration),
                  curve: Curves.decelerate,
                  width: _controller.isCompleted
                      ? _controller.value * width(context)
                      : 47,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.whiteColor.withOpacity(0.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: AnimatedOpacity(
                        duration: Duration(seconds: animationDuration - 200),
                        curve: Curves.decelerate,
                        opacity: _controller.isCompleted ? 0 : 1,
                        child: Text('Glaskova St.,25',
                            softWrap: false,
                            overflow: TextOverflow.clip,
                            style: TextStyles.style15Regular
                                .copyWith(color: AppColors.greyColor),
                            textAlign: TextAlign.center),
                      )),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor),
                        child: Icon(
                          Icons.chevron_right_outlined,
                          color: AppColors.accentColor,
                          size: 17,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
