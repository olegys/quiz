import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../i18n/strings.g.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_shadows.dart';
import '../../../themes/app_text_styles.dart';

class GameTimer extends StatelessWidget {
  final bool isActive;
  final int totalTime;
  final int remindTime;

  const GameTimer({
    super.key,
    required this.isActive,
    required this.totalTime,
    required this.remindTime,
  });

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);
    final double progress =
        totalTime > 0 && isActive ? remindTime / totalTime : 0;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 112.0.r,
          height: 112.0.r,
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0, end: progress),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) {
              return CircularProgressIndicator(
                value: value,
                backgroundColor: AppColors.backgroundTwo,
                color: remindTime <= 60 ? AppColors.red : AppColors.accentOne,
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
          child: isActive
              ? Column(
                  children: [
                    Text(
                      tr.timer.toUpperCase(),
                      style: AppTextStyles.regular12.copyWith(
                        color: AppColors.layerOne,
                      ),
                    ),
                    Text(
                      StopWatchTimer.getDisplayTime(
                        StopWatchTimer.getMilliSecFromSecond(remindTime),
                        hours: false,
                        milliSecond: false,
                      ),
                      style: AppTextStyles.mono24,
                    ),
                  ],
                )
              : null,
        ),
      ],
    );
  }
}
