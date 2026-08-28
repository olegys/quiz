import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../themes/app_colors.dart';
import '../themes/app_shadows.dart';
import '../themes/app_text_styles.dart';
import 'buttons/custom_tap.dart';

class ErrorToast extends StatelessWidget {
  final String title;
  final String action;
  final VoidCallback onAction;

  const ErrorToast({
    super.key,
    required this.title,
    required this.action,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0.r),
      padding: EdgeInsets.all(8.0.r),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(40.0.r),
        boxShadow: AppShadows.shadowTwo,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 12.0.w,
          ),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.medium16,
            ),
          ),
          SizedBox(
            width: 8.0.w,
          ),
          CustomTap(
            onTap: onAction,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0.w,
                vertical: 10.0.h,
              ),
              child: Text(
                action,
                style: AppTextStyles.bold18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
