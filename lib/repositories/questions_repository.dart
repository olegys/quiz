import 'package:dio/dio.dart';

import '../helpers/app_enums.dart';
import '../models/category_response.dart';
import '../models/question_response.dart';
import '../services/api_service.dart';

class QuestionsRepository {
  final ApiService _apiService;

  QuestionsRepository(this._apiService);

  late final Dio _api = _apiService.api;

  Future<CategoryResponse> getCategories({
    CancelToken? cancelToken,
  }) async {
    final Response response = await _api.get(
      '/api_category.php',
      cancelToken: cancelToken,
    );

    return CategoryResponse.fromJson(
      response.data,
    );
  }

  Future<QuestionResponse> getQuestions({
    required int amount,
    int? category,
    QuestionDifficulty? difficulty,
    QuestionType? type,
    CancelToken? cancelToken,
  }) async {
    final Response response = await _api.get(
      '/api.php',
      queryParameters: {
        'amount': amount,
        'category': category,
        'difficulty': difficulty?.name,
        'type': type?.name,
      }..removeWhere((_, value) => value == null),
      cancelToken: cancelToken,
    );

    return QuestionResponse.fromJson(
      response.data,
    );
  }
}
