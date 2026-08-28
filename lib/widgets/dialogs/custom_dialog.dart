import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../i18n/strings.g.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String description;
  final String action;
  final Color? color;

  const CustomDialog({
    super.key,
    required this.title,
    required this.description,
    required this.action,
    this.color = AppColors.red,
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0.w,
            ),
            child: Text(
              description,
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
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: CupertinoButton(
                    onPressed: SmartDialog.dismiss,
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.zero,
                    minSize: 44.0.h,
                    child: Text(
                      tr.cancel,
                      style: AppTextStyles.light16,
                    ),
                  ),
                ),
                VerticalDivider(
                  width: 1.0.w,
                  color: AppColors.layerFive,
                ),
                Expanded(
                  child: CupertinoButton(
                    onPressed: () => SmartDialog.dismiss(result: true),
                    padding: EdgeInsets.zero,
                    borderRadius: BorderRadius.zero,
                    minSize: 44.0.h,
                    child: Text(
                      action,
                      style: AppTextStyles.medium16.copyWith(
                        color: color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
