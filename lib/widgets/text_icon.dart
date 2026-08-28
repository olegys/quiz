import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class TextIcon extends StatelessWidget {
  final String icon;
  final double? size;

  const TextIcon({
    super.key,
    required this.icon,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size ?? 30.0.r,
      child: Center(
        child: FittedBox(
          child: Text(
            icon,
            style: AppTextStyles.mono24.copyWith(
              color: AppColors.accentTwo,
            ),
          ),
        ),
      ),
    );
  }
}
