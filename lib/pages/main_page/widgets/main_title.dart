import 'package:flutter/material.dart';

import '../../../i18n/strings.g.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${tr.your} ',
            style: AppTextStyles.mono44,
          ),
          TextSpan(
            text: tr.victoryIsRight,
            style: AppTextStyles.mono44.copyWith(
              color: AppColors.layerTwo,
            ),
          ),
          TextSpan(
            text: ' ${tr.hereJustProveItTo} ',
            style: AppTextStyles.mono44,
          ),
          TextSpan(
            text: tr.yourself,
            style: AppTextStyles.mono44.copyWith(
              color: AppColors.layerOne,
            ),
          ),
          TextSpan(
            text: '.',
            style: AppTextStyles.mono44,
          ),
        ],
      ),
    );
  }
}
