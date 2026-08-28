import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSvg extends StatelessWidget {
  final String assetName;
  final double? size;
  final double? width;
  final double? height;
  final Color? color;
  final AlignmentGeometry alignment;
  final BoxFit fit;

  const CustomSvg(
    this.assetName, {
    super.key,
    this.size,
    this.width,
    this.height,
    this.color,
    this.alignment = Alignment.center,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width ?? size,
      height: height ?? size,
      alignment: alignment,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
