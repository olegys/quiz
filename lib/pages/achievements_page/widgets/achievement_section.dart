import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

import '../../../gen/assets.gen.dart';
import '../../../helpers/app_enums.dart';
import '../../../helpers/app_extensions.dart';
import '../../../models/achievement.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';
import '../../../widgets/buttons/custom_tap.dart';
import '../../../widgets/custom_svg.dart';
import '../../../widgets/text_icon.dart';

class AchievementSection extends StatelessWidget {
  final AchievementGroup group;
  final List<Achievement> achievements;

  const AchievementSection({
    super.key,
    required this.group,
    required this.achievements,
  });

  Future<void> _share(String emoji, String title) async {
    SharePlus.instance.share(
      ShareParams(
        text: '$emoji I got the “$title” achievement.\n'
            'Come and join the game! Try to catch up with me.',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10.0.w,
          ),
          child: Text(
            group.getTitle(context),
            style: AppTextStyles.bold18,
          ),
        ),
        SizedBox(
          height: 10.0.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 20.0.h,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0.r),
            color: AppColors.backgroundTwo,
            border: Border.all(
              width: 1.0.r,
              color: AppColors.layerFive,
            ),
          ),
          child: SeparatedColumn(
            separatorBuilder: () => Divider(
              indent: 60.0.w,
              height: 16.0.h,
              thickness: 1.0.h,
              color: AppColors.layerFive,
            ),
            children: achievements
                .map(
                  (e) => CustomTap(
                    onTap: e.isUnlocked ? () => _share(e.icon, e.title) : null,
                    child: SeparatedRow(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0.w,
                      ),
                      separatorBuilder: () => SizedBox(
                        width: 10.0.w,
                      ),
                      children: [
                        TextIcon(
                          icon: e.icon,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                e.title,
                                style: AppTextStyles.medium16,
                              ),
                              Text(
                                '— ${e.description}',
                                style: AppTextStyles.light14.copyWith(
                                  color: AppColors.layerOne,
                                ),
                              ),
                            ],
                          ),
                        ),
                        e.isUnlocked
                            ? CustomSvg(
                                Assets.icons.checkRounded.path,
                                color: AppColors.green,
                                size: 24.0.r,
                              )
                            : CustomSvg(
                                Assets.icons.lock.path,
                                color: AppColors.red,
                                size: 24.0.r,
                              ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
