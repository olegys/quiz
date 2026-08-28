import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';
import '../../../widgets/buttons/custom_tap.dart';
import '../../../widgets/custom_svg.dart';
import '../../../widgets/text_icon.dart';

class SettingsCard extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback? onTap;

  const SettingsCard({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTap(
      onTap: onTap,
      child: SeparatedRow(
        padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        separatorBuilder: () => SizedBox(width: 10.0.w),
        children: [
          TextIcon(
            icon: icon,
          ),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.medium16,
            ),
          ),
          CustomSvg(
            Assets.icons.chevronRight.path,
            color: AppColors.accentThree,
            size: 24.0.r,
          ),
        ],
      ),
    );
  }
}
