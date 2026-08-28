import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../../models/question.dart';
import '../../../../models/question_response.dart';
import '../../../../models/quiz_options.dart';
import '../../../../repositories/questions_repository.dart';

part 'game_cubit.freezed.dart';
part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  final QuizOptions _quizOptions;
  final QuestionsRepository _questionsRepository;
  CancelToken _cancelToken = CancelToken();
  StopWatchTimer? _remindTimer;

  GameCubit(this._quizOptions, this._questionsRepository)
      : super(const GameState());

  Future<void> initGame() async {
    try {
      _cancelToken.cancel();
      _cancelToken = CancelToken();

      final QuestionResponse response = await _questionsRepository.getQuestions(
        amount: _quizOptions.amount,
        category: _quizOptions.category,
        difficulty: _quizOptions.difficulty,
        type: _quizOptions.type,
        cancelToken: _cancelToken,
      );

      final List<Question> questions = response.results;
      final int totalTime = _quizOptions.amount * 60;

      emit(
        state.copyWith(
          questions: questions,
          totalTime: totalTime,
          remindTime: totalTime,
        ),
      );
    } catch (e) {
      log('$e');
    }
  }

  void startGame() async {
    if (state.questions.isEmpty) {
      await initGame();
    }

    nextQuestion();

    _remindTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromSecond(
        state.totalTime,
      ),
      onChangeRawSecond: (remindTime) => emit(
        state.copyWith(
          remindTime: remindTime,
        ),
      ),
      onEnded: finishGame,
    );

    if (state.status.isActive) {
      _remindTimer?.onStartTimer();
    }
  }

  void nextQuestion() {
    final List<Question> questions = [...state.questions];
    final int index = state.index == null ? 0 : state.index! + 1;

    if (questions.isNotEmpty) {
      final Question currentQuestion = questions[index].copyWith(
        allAnswers: [
          questions[index].correctAnswer,
          ...questions[index].incorrectAnswers,
        ]..shuffle(),
      );

      emit(
        state.copyWith(
          currentQuestion: currentQuestion,
          index: index,
        ),
      );
    }
  }

  void answerQuestion(String answer) {
    final List<Question> questions = [...state.questions];
    final Question? currentQuestion = state.currentQuestion;

    if (currentQuestion != null) {
      questions[state.index!] = questions[state.index!].copyWith(
        userAnswer: answer,
      );

      final bool isLast = state.index == questions.length - 1;

      if (isLast) {
        _remindTimer?.onStopTimer();
      } else {
        _remindTimer?.onStartTimer();
      }

      emit(
        state.copyWith(
          status: isLast ? GameStatus.finished : GameStatus.active,
          questions: questions,
          currentQuestion: currentQuestion.copyWith(
            userAnswer: answer,
          ),
        ),
      );
    }
  }

  void finishGame() {
    _remindTimer?.onStopTimer();

    emit(
      state.copyWith(
        status: GameStatus.finished,
      ),
    );
  }

  void pause() {
    _remindTimer?.onStopTimer();

    emit(
      state.copyWith(
        status: GameStatus.paused,
      ),
    );
  }

  void resume() {
    _remindTimer?.onStartTimer();

    emit(
      state.copyWith(
        status: GameStatus.active,
      ),
    );
  }

  void stopTimer() {
    _remindTimer?.onStopTimer();

    emit(
      state.copyWith(
        status: GameStatus.animating,
      ),
    );
  }

  @override
  Future<void> close() {
    _remindTimer?.dispose();
    _cancelToken.cancel();
    return super.close();
  }
}
