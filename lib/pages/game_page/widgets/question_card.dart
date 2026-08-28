import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_unescape/html_unescape.dart';

import '../../../models/question.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_text_styles.dart';

class QuestionCard extends StatelessWidget {
  final Question currentQuestion;
  final List<Question> questions;
  final int index;
  final bool isPaused;

  const QuestionCard({
    super.key,
    required this.currentQuestion,
    required this.questions,
    required this.index,
    required this.isPaused,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: AppColors.accentTwo,
      child: Stack(
        children: [
          PaddedRow(
            padding: EdgeInsets.all(40.0.r).copyWith(
              right: 44.0.r,
            ),
            children: [
              Expanded(
                child: Text(
                  currentQuestion.category,
                  style: AppTextStyles.medium16.copyWith(
                    color: AppColors.backgroundTwo,
                  ),
                ),
              ),
              SizedBox(
                width: 10.0.w,
              ),
              Text(
                '${index + 1} / ${questions.length}',
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.backgroundOne,
                ),
              ),
            ],
          ),
          if (!isPaused)
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 64.0.w,
                ),
                child: Text(
                  HtmlUnescape().convert(currentQuestion.question),
                  style: AppTextStyles.bold18.copyWith(
                    color: AppColors.backgroundTwo,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
