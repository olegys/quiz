import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';
import '../themes/app_colors.dart';
import '../themes/app_shadows.dart';
import '../themes/app_text_styles.dart';
import 'buttons/custom_icon_button.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onPressed;

  const MainAppBar({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(120.0.r);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(20.0.r),
        padding: EdgeInsets.all(10.0.r).copyWith(left: 30.0.w),
        decoration: BoxDecoration(
          color: AppColors.backgroundOne,
          borderRadius: BorderRadius.circular(40.0.r),
          boxShadow: AppShadows.shadowTwo,
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.bold18,
              ),
            ),
            SizedBox(
              width: 10.0.w,
            ),
            CustomIconButton(
              icon: Assets.icons.settings.path,
              iconColor: AppColors.accentOne,
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
