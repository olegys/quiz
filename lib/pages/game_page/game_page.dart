import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:lottie/lottie.dart';

import '../../gen/assets.gen.dart';
import '../../helpers/app_enums.dart';
import '../../i18n/strings.g.dart';
import '../../logic/user_cubit/user_cubit.dart';
import '../../models/question.dart';
import '../../models/quiz.dart';
import '../../models/quiz_options.dart';
import '../../repositories/questions_repository.dart';
import '../../routes/app_routes.dart';
import '../../themes/app_colors.dart';
import '../../themes/app_text_styles.dart';
import '../../widgets/buttons/custom_icon_button.dart';
import '../../widgets/buttons/custom_tap.dart';
import '../../widgets/custom_svg.dart';
import '../../widgets/dialogs/custom_dialog.dart';
import 'logic/game_cubit/game_cubit.dart';
import 'widgets/correct_answer_card.dart';
import 'widgets/game_board.dart';
import 'widgets/game_timer.dart';
import 'widgets/incorrect_answer_card.dart';
import 'widgets/question_card.dart';

class GamePage extends StatefulWidget {
  final QuizOptions quizOptions;

  const GamePage({
    super.key,
    required this.quizOptions,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage>
    with SingleTickerProviderStateMixin {
  late final GameCubit _gameCubit;
  late final AnimationController _controller;

  Future<void> _back(BuildContext context) async {
    final Translations tr = Translations.of(context);
    final bool isAnimating = _controller.status.isAnimating;

    if (isAnimating) {
      _controller.stop();
    }

    _gameCubit.pause();

    final bool? isBack = await SmartDialog.show(
      maskColor: AppColors.backgroundThree,
      builder: (_) => CustomDialog(
        title: tr.exitQuiz,
        description: tr.areYouSureYouWantToExit,
        action: tr.exit,
      ),
    );

    if (isBack == true && context.mounted) {
      Navigator.of(context).pop();
    } else {
      if (isAnimating) {
        _controller.forward();
      }

      _gameCubit.resume();
    }
  }

  bool isComeback(List<Question> questions) {
    if (questions.isEmpty) return false;
    if (questions.first.userAnswer == questions.first.correctAnswer) {
      return false;
    }

    for (int i = 1; i < questions.length; i++) {
      if (questions[i].userAnswer != questions[i].correctAnswer) return false;
    }

    return true;
  }

  bool isStreak(List<Question> questions) {
    int streak = 0;

    for (Question question in questions) {
      if (question.userAnswer == question.correctAnswer) {
        streak++;
        if (streak >= 5) return true;
      } else {
        streak = 0;
      }
    }

    return false;
  }

  Quiz _getQuiz(BuildContext context) {
    final GameState gameState = context.read<GameCubit>().state;
    final List<Question> questions = gameState.questions;
    final List<Question> correctAnswers =
        questions.where((e) => e.userAnswer == e.correctAnswer).toList();
    final List<Question> incorrectAnswers = questions
        .where((e) => e.userAnswer != null && e.userAnswer != e.correctAnswer)
        .toList();
    final double winRate = (correctAnswers.length / questions.length) * 100;
    final int time = gameState.totalTime - gameState.remindTime;
    final bool isCompleted = questions.every((e) => e.userAnswer != null);

    return Quiz(
      time: time,
      date: DateTime.now(),
      options: widget.quizOptions,
      questions: questions,
      currentQuestion: gameState.index!,
      winRate: winRate.toInt(),
      withoutMistakes: correctAnswers.length == questions.length,
      less1Minute: time < 60,
      isComeback: isComeback(questions),
      isStreak: isStreak(questions),
      correctAnswers: correctAnswers.length,
      incorrectAnswers: incorrectAnswers.length,
      isCompleted: isCompleted,
    );
  }

  void _finished(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
      AppRoutes.result,
      arguments: _getQuiz(context),
    );
  }

  @override
  void initState() {
    super.initState();
    _gameCubit = GameCubit(
      widget.quizOptions,
      context.read<QuestionsRepository>(),
    )..initGame();

    _controller = AnimationController(vsync: this);
    _controller.addStatusListener((status) {
      if (status.isCompleted) {
        _gameCubit.startGame();
      }
    });
  }

  @override
  void dispose() {
    _gameCubit.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Translations tr = Translations.of(context);

    return BlocProvider.value(
      value: _gameCubit,
      child: Scaffold(
        body: BlocConsumer<GameCubit, GameState>(
          listenWhen: (p, c) => c.status.isFinished,
          listener: (context, _) => context.read<UserCubit>().addQuiz(
                _getQuiz(context),
              ),
          builder: (context, state) => Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    child: state.currentQuestion == null
                        ? Container(
                            height: double.infinity,
                            color: AppColors.accentTwo,
                            child: Lottie.asset(
                              Assets.lottie.loaderQuiz,
                              controller: _controller,
                              width: 132.0.w,
                              height: 51.0.h,
                              onLoaded: (composition) => _controller
                                ..duration = composition.duration
                                ..forward(),
                            ),
                          )
                        : state.currentQuestion!.userAnswer == null
                            ? QuestionCard(
                                currentQuestion: state.currentQuestion!,
                                questions: state.questions,
                                index: state.index!,
                                isPaused: state.status.isPaused,
                              )
                            : state.currentQuestion?.userAnswer ==
                                    state.currentQuestion?.correctAnswer
                                ? CorrectAnswerCard(
                                    currentQuestion: state.currentQuestion!,
                                    questions: state.questions,
                                    index: state.index!,
                                  )
                                : IncorrectAnswerCard(
                                    currentQuestion: state.currentQuestion!,
                                    questions: state.questions,
                                    index: state.index!,
                                  ),
                  ),
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        GameBoard(
                          currentQuestion: state.currentQuestion,
                          type: state.currentQuestion != null
                              ? state.currentQuestion!.type
                              : QuestionType.multiple,
                          answers: state.currentQuestion != null &&
                                  (!state.status.isPaused ||
                                      state.currentQuestion?.userAnswer != null)
                              ? state.currentQuestion!.allAnswers
                              : [],
                          onAnswer: _gameCubit.answerQuestion,
                        ),
                        GameTimer(
                          isActive: state.currentQuestion != null,
                          totalTime: state.totalTime,
                          remindTime: state.remindTime,
                        ),
                      ],
                    ),
                  ),
                  if (state.currentQuestion?.userAnswer != null ||
                      state.status.isFinished)
                    SizedBox(
                      width: 81.0.w,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          if (state.index! != state.questions.length - 1 &&
                              !state.status.isFinished)
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(
                                vertical: 44.0.h,
                              ),
                              child: Text(
                                '${state.index! + 2} / ${state.questions.length}',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.regular12.copyWith(
                                  color: AppColors.layerOne,
                                ),
                              ),
                            ),
                          state.index! != state.questions.length - 1 &&
                                  !state.status.isFinished
                              ? CustomTap(
                                  onTap: _gameCubit.nextQuestion,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        tr.next.toUpperCase(),
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
                                )
                              : CustomTap(
                                  onTap: () => _finished(context),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        tr.finished.toUpperCase(),
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
                        ],
                      ),
                    ),
                ],
              ),
              Positioned(
                left: 30.0.r,
                bottom: 30.0.r,
                child: CustomIconButton(
                  icon: Assets.icons.exit.path,
                  onPressed: () => _back(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
