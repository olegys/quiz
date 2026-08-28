import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_unescape/html_unescape.dart';

import '../../../models/question.dart';
import '../../../themes/app_colors.dart';
import '../../../themes/app_shadows.dart';
import '../../../themes/app_text_styles.dart';
import '../../../widgets/buttons/custom_tap.dart';
import '../logic/game_cubit/game_cubit.dart';

class AnswerCard extends StatefulWidget {
  final Question? currentQuestion;
  final String? answer;
  final BorderRadiusGeometry? borderRadius;
  final ValueChanged<String> onAnswer;

  const AnswerCard({
    super.key,
    this.currentQuestion,
    this.answer,
    this.borderRadius,
    required this.onAnswer,
  });

  @override
  State<AnswerCard> createState() => _AnswerCardState();
}

class _AnswerCardState extends State<AnswerCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  void _selectAnswer() async {
    context.read<GameCubit>().stopTimer();

    _controller
      ..reset()
      ..forward();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _colorAnimation = TweenSequence<Color?>([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.transparent, end: AppColors.accentOne),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: AppColors.accentOne, end: Colors.transparent),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.transparent, end: AppColors.accentOne),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: AppColors.accentOne, end: Colors.transparent),
        weight: 1.0,
      ),
    ]).animate(_controller);

    _controller.addStatusListener((status) {
      if (status.isCompleted) {
        _controller.reset();
        widget.onAnswer(widget.answer!);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isCurrent = widget.currentQuestion?.userAnswer != null &&
        widget.currentQuestion?.userAnswer == widget.answer;
    final bool isCorrect = widget.currentQuestion?.userAnswer ==
        widget.currentQuestion?.correctAnswer;

    return Expanded(
      child: BlocConsumer<GameCubit, GameState>(
        listenWhen: (p, c) => p.status.isPaused != c.status.isPaused,
        listener: (context, state) {
          if (state.status.isPaused && _colorAnimation.isAnimating) {
            _controller.stop();
          }

          if (!state.status.isPaused && _colorAnimation.isAnimating) {
            context.read<GameCubit>().stopTimer();
            _controller.forward();
          }
        },
        builder: (context, state) {
          return CustomTap(
            onTap: widget.answer != null &&
                    widget.currentQuestion?.userAnswer == null &&
                    !state.status.isAnimating &&
                    !state.status.isFinished
                ? _selectAnswer
                : null,
            child: AnimatedBuilder(
              animation: _colorAnimation,
              builder: (context, child) {
                return Container(
                  padding: EdgeInsets.all(10.0.r),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isCurrent || _colorAnimation.isAnimating
                        ? AppColors.layerFive
                        : AppColors.backgroundOne,
                    borderRadius: widget.borderRadius,
                    boxShadow: AppShadows.shadowTwo,
                    border: Border.all(
                      width: 4.0.r,
                      color: isCurrent
                          ? isCorrect
                              ? AppColors.green
                              : AppColors.red
                          : _colorAnimation.value!,
                    ),
                  ),
                  child: widget.answer != null
                      ? Text(
                          HtmlUnescape().convert(widget.answer!),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.bold18,
                        )
                      : null,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
