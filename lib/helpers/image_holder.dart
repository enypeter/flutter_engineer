import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImageHolder extends StatelessWidget {
  const ImageHolder({
    super.key,
    required this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
    this.borderRadius,
    this.alignment,
    this.imageKey,
    this.matchTextDirection,
  });

  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;
  final Key? imageKey;
  final BorderRadius? borderRadius;
  final Alignment? alignment;
  final bool? matchTextDirection;

  @override
  Widget build(BuildContext context) => (imagePath.contains('.svg'))
      ? SvgPicture.asset(imagePath,
          width: width,
          height: height,
          fit: fit,
          key: imageKey,
          colorFilter:
              color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
          matchTextDirection: matchTextDirection ?? false)
      : Image.asset(imagePath,
          width: width,
          height: height,
          fit: fit,
          color: color,
          key: imageKey,
          matchTextDirection: matchTextDirection ?? false);
}
