import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../i18n/strings.g.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_shadows.dart';
import '../../../themes/app_text_styles.dart';
import '../../../widgets/buttons/custom_icon_button.dart';

class StartCard extends StatelessWidget {
  final VoidCallback? onPressed;

  const StartCard({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return Expanded(
      child: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          color: AppColors.accentOne,
          borderRadius: BorderRadius.circular(40.0.r),
          boxShadow: AppShadows.shadowTwo,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              Assets.images.start.path,
            ),
          ),
        ),
        child: SeparatedRow(
          padding: EdgeInsets.all(10.0.r).copyWith(left: 30.0.w),
          separatorBuilder: () => SizedBox(
            width: 10.0.w,
          ),
          children: [
            SizedBox.square(
              dimension: 30.0.r,
              child: Text(
                '🕹️',
                style: AppTextStyles.mono24,
              ),
            ),
            Expanded(
              child: Text(
                tr.startGame,
                style: AppTextStyles.medium16.copyWith(
                  color: AppColors.backgroundTwo,
                ),
              ),
            ),
            CustomIconButton(
              icon: Assets.icons.chevronRightTop.path,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
