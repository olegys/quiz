import 'package:flextras/flextras.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helpers/app_enums.dart';
import '../../../models/question.dart';
import '../../../themes/app_colors.dart';
import 'answer_card.dart';

class GameBoard extends StatelessWidget {
  final QuestionType type;
  final List<String>? answers;
  final Question? currentQuestion;
  final ValueChanged<String> onAnswer;

  const GameBoard({
    super.key,
    required this.type,
    this.answers,
    this.currentQuestion,
    required this.onAnswer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundTwo,
      padding: currentQuestion?.userAnswer != null
          ? EdgeInsets.symmetric(
              vertical: 10.0.r,
              horizontal: 5.0.r,
            )
          : EdgeInsets.all(10.0.r),
      child: SeparatedColumn(
        separatorBuilder: () => SizedBox(
          height: 6.0.r,
        ),
        children: [
          Expanded(
            child: SeparatedRow(
              separatorBuilder: () => SizedBox(
                width: 6.0.r,
              ),
              children: [
                AnswerCard(
                  onAnswer: onAnswer,
                  currentQuestion: currentQuestion,
                  borderRadius: type == QuestionType.multiple
                      ? BorderRadius.all(
                          Radius.circular(8.0.r),
                        ).copyWith(
                          topLeft: Radius.circular(50.0.r),
                        )
                      : BorderRadius.vertical(
                          top: Radius.circular(50.0.r),
                          bottom: Radius.circular(8.0.r),
                        ),
                  answer: answers?.elementAtOrNull(0),
                ),
                if (type == QuestionType.multiple)
                  AnswerCard(
                    onAnswer: onAnswer,
                    currentQuestion: currentQuestion,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0.r),
                    ).copyWith(
                      topRight: Radius.circular(50.0.r),
                    ),
                    answer: answers?.elementAtOrNull(1),
                  ),
              ],
            ),
          ),
          Expanded(
            child: SeparatedRow(
              separatorBuilder: () => SizedBox(
                width: 6.0.r,
              ),
              children: [
                AnswerCard(
                  onAnswer: onAnswer,
                  currentQuestion: currentQuestion,
                  borderRadius: type == QuestionType.multiple
                      ? BorderRadius.all(
                          Radius.circular(8.0.r),
                        ).copyWith(
                          bottomLeft: Radius.circular(50.0.r),
                        )
                      : BorderRadius.vertical(
                          top: Radius.circular(8.0.r),
                          bottom: Radius.circular(50.0.r),
                        ),
                  answer: answers
                      ?.elementAtOrNull(type == QuestionType.multiple ? 2 : 1),
                ),
                if (type == QuestionType.multiple)
                  AnswerCard(
                    onAnswer: onAnswer,
                    currentQuestion: currentQuestion,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0.r),
                    ).copyWith(
                      bottomRight: Radius.circular(50.0.r),
                    ),
                    answer: answers?.elementAtOrNull(3),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
