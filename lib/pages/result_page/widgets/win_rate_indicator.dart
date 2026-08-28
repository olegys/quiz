import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../i18n/strings.g.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_shadows.dart';
import '../../../themes/app_text_styles.dart';

class WinRateIndicator extends StatelessWidget {
  final int winRate;

  const WinRateIndicator({
    super.key,
    required this.winRate,
  });

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 112.0.r,
          height: 112.0.r,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: winRate / 100),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) {
              return CircularProgressIndicator(
                value: value,
                backgroundColor: AppColors.backgroundTwo,
                color: AppColors.accentOne,
                strokeWidth: 6.0.r,
                strokeAlign: -1,
              );
            },
          ),
        ),
        Container(
          width: 100.0.r,
          height: 100.0.r,
          padding: EdgeInsets.only(
            top: 22.0.r,
          ),
          decoration: BoxDecoration(
            color: AppColors.backgroundOne,
            boxShadow: AppShadows.shadowOne,
            shape: BoxShape.circle,
          ),
          child: Column(
            children: [
              Text(
                tr.winRate.toUpperCase(),
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.layerOne,
                ),
              ),
              Text(
                '$winRate%',
                style: AppTextStyles.mono24,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
