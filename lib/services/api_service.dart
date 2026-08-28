import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final Dio api = Dio(
    BaseOptions(
      baseUrl: 'https://opentdb.com',
    ),
  );

  ApiService() {
    api.interceptors.addAll(
      [
        PrettyDioLogger(
          enabled: kDebugMode,
        ),
        RetryInterceptor(
          dio: api,
          retries: 60,
          retryDelays: const [
            Duration(seconds: 5),
          ],
          retryEvaluator: DefaultRetryEvaluator(
            {...defaultRetryableStatuses}..remove(
                status500InternalServerError,
              ),
          ).evaluate,
        ),
      ],
    );
  }
}
