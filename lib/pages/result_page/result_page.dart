import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../gen/assets.gen.dart';
import '../../i18n/strings.g.dart';
import '../../models/quiz.dart';
import '../../routes/app_routes.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_shadows.dart';
import '../../themes/app_text_styles.dart';
import '../../widgets/buttons/custom_icon_button.dart';
import '../../widgets/buttons/custom_tap.dart';
import '../../widgets/custom_svg.dart';
import '../../widgets/dialogs/custom_dialog.dart';
import 'widgets/win_rate_indicator.dart';

class ResultPage extends StatelessWidget {
  final Quiz quiz;

  const ResultPage({
    super.key,
    required this.quiz,
  });

  Future<void> _restart(BuildContext context) async {
    final Translations tr = Translations.of(context);

    final bool? isRestart = await SmartDialog.show(
      maskColor: AppColors.backgroundThree,
      builder: (_) => CustomDialog(
        title: tr.restartQuiz,
        description: tr.areYouSureYouWantToRestart,
        action: tr.restart,
        color: AppColors.accentOne,
      ),
    );

    if (isRestart == true && context.mounted) {
      Navigator.of(context).pushReplacementNamed(
        AppRoutes.game,
        arguments: quiz.options,
      );
    }
  }

  Future<void> _main(BuildContext context) async {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  margin: EdgeInsets.all(10.0.r).copyWith(
                    right: 5.0.r,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundTwo,
                    borderRadius: BorderRadius.circular(50.0.r),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        Assets.images.finished.path,
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      PaddedRow(
                        padding: EdgeInsets.all(30.0.r).copyWith(
                          right: 34.0.r,
                        ),
                        children: [
                          Expanded(
                            child: Text(
                              quiz.questions.last.category,
                              style: AppTextStyles.medium16,
                            ),
                          ),
                          SizedBox(
                            width: 10.0.w,
                          ),
                          Text(
                            '${quiz.currentQuestion + 1} / ${quiz.questions.length}',
                            style: AppTextStyles.regular12.copyWith(
                              color: AppColors.layerOne,
                            ),
                          ),
                        ],
                      ),
                      SeparatedRow(
                        padding: EdgeInsets.symmetric(
                          horizontal: 54.0.w,
                        ),
                        separatorBuilder: () => SizedBox(
                          width: 10.0.w,
                        ),
                        children: [
                          Expanded(
                            child: SeparatedColumn(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              separatorBuilder: () => SizedBox(
                                height: 8.0.h,
                              ),
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 30.0.r,
                                      height: 30.0.r,
                                      decoration: BoxDecoration(
                                        color: AppColors.backgroundOne,
                                        boxShadow: AppShadows.shadowFour,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    CustomSvg(
                                      Assets.icons.finished.path,
                                      size: 32.0.r,
                                    ),
                                  ],
                                ),
                                Text(
                                  tr.finished,
                                  style: AppTextStyles.bold18.copyWith(
                                    shadows: AppShadows.shadowFour,
                                  ),
                                ),
                                Text(
                                  tr.yourResult(
                                    correct: quiz.correctAnswers,
                                    incorrect: quiz.incorrectAnswers,
                                  ),
                                  style: AppTextStyles.medium16.copyWith(
                                    color: AppColors.layerOne,
                                    shadows: AppShadows.shadowFour,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          WinRateIndicator(
                            winRate: quiz.winRate,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 81.0.w,
                height: double.infinity,
                child: CustomTap(
                  onTap: () => _main(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        tr.main.toUpperCase(),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.regular12,
                      ),
                      SizedBox(
                        height: 6.0.h,
                      ),
                      CustomSvg(
                        Assets.icons.next.path,
                        size: 32.0.r,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 30.0.r,
            bottom: 30.0.r,
            child: CustomIconButton(
              icon: Assets.icons.restart.path,
              onPressed: () => _restart(context),
            ),
          ),
        ],
      ),
    );
  }
}
