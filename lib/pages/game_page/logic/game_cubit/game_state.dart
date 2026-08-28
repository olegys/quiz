part of 'game_cubit.dart';

enum GameStatus {
  active,
  animating,
  paused,
  finished,
}

extension ReportDamageStatusX on GameStatus {
  bool get isActive => this == GameStatus.active;
  bool get isAnimating => this == GameStatus.animating;
  bool get isPaused => this == GameStatus.paused;
  bool get isFinished => this == GameStatus.finished;
}

@freezed
class GameState with _$GameState {
  const factory GameState({
    @Default(GameStatus.active) GameStatus status,
    @Default(0) int totalTime,
    @Default(0) int remindTime,
    @Default([]) List<Question> questions,
    Question? currentQuestion,
    int? index,
  }) = _GameState;
}
