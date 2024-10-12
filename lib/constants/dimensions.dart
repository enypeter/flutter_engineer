import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double height(context) => MediaQuery.of(context).size.height;

double width(context) => MediaQuery.of(context).size.width;

largeVerticalSpace(context, factor) =>
    SizedBox(height: height(context) * factor);

largeHorizontalSpace(context, factor) =>
    SizedBox(width: width(context) * factor);

get mediumHorizontalSpace => SizedBox(width: 20.h);
get mediumVerticalSpace => SizedBox(height: 20.h);

get smallVerticalSpace => SizedBox(height: 10.h);

get smallHorizontalSpace => SizedBox(width: 10.w);

get tinyVerticalSpace => SizedBox(height: 5.h);

get tinyHorizontalSpace => SizedBox(width: 5.w);
