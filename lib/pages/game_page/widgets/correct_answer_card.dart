import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_unescape/html_unescape.dart';

import '../../../gen/assets.gen.dart';
import '../../../i18n/strings.g.dart';
import '../../../models/question.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_shadows.dart';
import '../../../themes/app_text_styles.dart';
import '../../../widgets/custom_svg.dart';

class CorrectAnswerCard extends StatelessWidget {
  final Question currentQuestion;
  final List<Question> questions;
  final int index;

  const CorrectAnswerCard({
    super.key,
    required this.currentQuestion,
    required this.questions,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return Container(
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
            Assets.images.correct.path,
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
                  currentQuestion.category,
                  style: AppTextStyles.medium16,
                ),
              ),
              SizedBox(
                width: 10.0.w,
              ),
              Text(
                '${index + 1} / ${questions.length}',
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.layerOne,
                ),
              ),
            ],
          ),
          SeparatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: 54.0.w,
            ),
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
                    Assets.icons.correct.path,
                    size: 32.0.r,
                  ),
                ],
              ),
              Text(
                '${tr.correct} ${currentQuestion.userAnswer}',
                style: AppTextStyles.bold18.copyWith(
                  shadows: AppShadows.shadowFour,
                ),
              ),
              Text(
                HtmlUnescape().convert(currentQuestion.question),
                style: AppTextStyles.medium16.copyWith(
                  color: AppColors.layerOne,
                  shadows: AppShadows.shadowFour,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
