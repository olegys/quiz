import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../i18n/strings.g.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';
import '../../../widgets/buttons/custom_tap.dart';
import '../../../widgets/custom_svg.dart';

class AmountSelector extends StatelessWidget {
  final int amount;
  final VoidCallback? onClear;
  final VoidCallback? onTap;

  const AmountSelector({
    super.key,
    required this.amount,
    this.onClear,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return CustomTap(
      onTap: onTap,
      child: Container(
        height: 62.0.h,
        decoration: BoxDecoration(
          color: AppColors.backgroundTwo,
          borderRadius: BorderRadius.circular(30.0.r),
          border: Border.all(
            width: 1.0.r,
            color: AppColors.layerFive,
          ),
        ),
        child: PaddedRow(
          padding: EdgeInsets.symmetric(
            horizontal: 18.0.w,
          ),
          children: [
            Expanded(
              child: PaddedColumn(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                padding: EdgeInsets.symmetric(
                  vertical: 10.0.h,
                ),
                children: [
                  Text(
                    tr.numberOfQuestions,
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.layerOne,
                    ),
                  ),
                  Text(
                    '$amount',
                    style: AppTextStyles.medium16,
                  ),
                ],
              ),
            ),
            CustomTap(
              onTap: onClear,
              child: CustomSvg(
                Assets.icons.close.path,
                color: AppColors.accentThree,
                size: 24.0.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
