import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';

class StatisticsCard extends StatelessWidget {
  final String icon;
  final String value;
  final String title;

  const StatisticsCard({
    super.key,
    required this.icon,
    required this.value,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 158.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0.r),
          border: Border.all(
            width: 1.0.r,
            color: AppColors.layerFive,
          ),
        ),
        child: SeparatedColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          separatorBuilder: () => SizedBox(
            height: 10.0.h,
          ),
          children: [
            SizedBox.square(
              dimension: 30.0.r,
              child: Center(
                child: Text(
                  icon,
                  style: AppTextStyles.mono24,
                ),
              ),
            ),
            Text(
              value,
              style: AppTextStyles.mono24.copyWith(
                color: AppColors.accentTwo,
              ),
            ),
            Text(
              title,
              style: AppTextStyles.regular12.copyWith(
                color: AppColors.layerOne,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
