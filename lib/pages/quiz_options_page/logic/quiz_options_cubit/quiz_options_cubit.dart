import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../helpers/app_enums.dart';

part 'quiz_options_cubit.freezed.dart';
part 'quiz_options_state.dart';

class QuizOptionsCubit extends Cubit<QuizOptionsState> {
  QuizOptionsCubit() : super(const QuizOptionsState());

  void changeAmount(String value) {
    emit(
      state.copyWith(
        amount: int.tryParse(value) ?? 0,
      ),
    );
  }

  void selectCategory(int? category) {
    emit(
      state.copyWith(
        category: category,
      ),
    );
  }

  void selectDifficulty(QuestionDifficulty? difficulty) {
    emit(
      state.copyWith(
        difficulty: difficulty,
      ),
    );
  }

  void selectType(QuestionType? type) {
    emit(
      state.copyWith(
        type: type,
      ),
    );
  }
}
