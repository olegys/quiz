import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../i18n/strings.g.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';
import '../text_icon.dart';

class AchievementDialog extends StatelessWidget {
  final String icon;
  final String title;

  const AchievementDialog({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return Container(
      width: 270.0.w,
      decoration: BoxDecoration(
        color: AppColors.backgroundOne,
        borderRadius: BorderRadius.circular(30.0.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20.0.h,
          ),
          TextIcon(
            icon: icon,
            size: 50.0.r,
          ),
          SizedBox(
            height: 8.0.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.bold18,
            ),
          ),
          SizedBox(
            height: 8.0.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
            ),
            child: Text(
              tr.youHaveAchievedNewMilestone,
              textAlign: TextAlign.center,
              style: AppTextStyles.light14.copyWith(
                color: AppColors.layerOne,
              ),
            ),
          ),
          SizedBox(
            height: 12.0.h,
          ),
          Divider(
            height: 1.0.h,
            thickness: 1.0.h,
            color: AppColors.layerFive,
          ),
          CupertinoButton(
            onPressed: SmartDialog.dismiss,
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.zero,
            minSize: 44.0.h,
            child: Text(
              tr.okay,
              style: AppTextStyles.medium16,
            ),
          ),
        ],
      ),
    );
  }
}
